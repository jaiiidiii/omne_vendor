// lib/presentation/widgets/search_bar.dart
import 'dart:async';
import 'package:flutter/material.dart';

class VendorSearchBar extends StatefulWidget {
  final Function(String) onChanged;

  const VendorSearchBar({super.key, required this.onChanged});

  @override
  State<VendorSearchBar> createState() => _VendorSearchBarState();
}

class _VendorSearchBarState extends State<VendorSearchBar> {
  final _textController = TextEditingController();
  Timer? _debounce;

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      widget.onChanged(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      textInputAction: TextInputAction.search,

      onChanged: _onSearchChanged,
      onSubmitted: (query) {
        // You can add logic here if a full search is needed on submit,
        // but for real-time filtering, onChanged is sufficient.
        // This is good practice for a formal search button or submit action.
        // e.g., print('Search submitted for: $query');
      },
      decoration: InputDecoration(
        labelText: 'Search for vendors...',
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
