import 'package:flutter/material.dart';
import 'package:omne_vendor/core/utils/debouncer.dart';

class VendorSearchBar extends StatefulWidget {
  final Function(String) onChanged;

  const VendorSearchBar({super.key, required this.onChanged});

  @override
  State<VendorSearchBar> createState() => _VendorSearchBarState();
}

class _VendorSearchBarState extends State<VendorSearchBar> {
  final _textController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 300);

  _onSearchChanged(String query) {
    _debouncer.run(() {
      widget.onChanged(query);
    });
  }

  @override
  void dispose() {
    _debouncer.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: TextField(
        controller: _textController,
        textInputAction: TextInputAction.search,
        onChanged: _onSearchChanged,
        onSubmitted: (query) {
          _debouncer.run(() {
            widget.onChanged(query);
          });
        },
        decoration: InputDecoration(
          labelText: 'Search for vendors...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _textController.clear();
              widget.onChanged('');
            },
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
