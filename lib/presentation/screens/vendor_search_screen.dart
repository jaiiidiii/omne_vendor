import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omne_vendor/logic/cubit/vendor_cubit.dart';
import 'package:omne_vendor/presentation/widgets/vendor_list.dart';

class VendorSearchScreen extends StatelessWidget {
  const VendorSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vendor Search')),
      body: GestureDetector(
        onTap: () {
          // Dismiss keyboard on tap outside
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
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
                    return VendorList(vendors: state.filteredVendors);
                  } else if (state is VendorError) {
                    return Center(child: Text(state.message));
                  }
                  return const Center(
                    child: Text('Start searching for vendors.'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
