import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omne_vendor/presentation/bloc/vendor/vendor_cubit.dart';
import 'package:omne_vendor/presentation/widgets/no_results.dart';
import 'package:omne_vendor/presentation/widgets/start_searching.dart';
import 'package:omne_vendor/presentation/widgets/theme_toggle_button.dart';
import 'package:omne_vendor/presentation/widgets/vendor_list.dart';
import 'package:omne_vendor/presentation/widgets/vendor_search_bar.dart';

class VendorSearchScreen extends StatelessWidget {
  const VendorSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendor Search'),
        actions: [const ThemeToggleButton()],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VendorSearchBar(
                onChanged: (query) {
                  context.read<VendorCubit>().filterVendors(query);
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<VendorCubit, VendorState>(
                builder: (context, state) {
                  if (state is VendorLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is VendorLoaded) {
                    if (state.vendors.isEmpty) {
                      return const NoResultsWidget();
                    } else if (state.filteredVendors.isEmpty) {
                      return const NoResultsWidget();
                    }
                    return VendorList(vendors: state.filteredVendors);
                  } else if (state is VendorError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  return const Center(child: StartSearchingWidget());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
