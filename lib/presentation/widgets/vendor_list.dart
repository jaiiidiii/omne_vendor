import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omne_vendor/data/models/vendor_model.dart';
import 'package:omne_vendor/logic/cubit/vendor_cubit.dart';
import 'package:omne_vendor/presentation/widgets/vendor_item.dart';

class VendorList extends StatelessWidget {
  final List<VendorModel> vendors;

  const VendorList({super.key, required this.vendors});

  @override
  Widget build(BuildContext context) {
    if (vendors.isEmpty) {
      return const Center(child: Text('No vendors found.'));
    }

    return RefreshIndicator(
      onRefresh: () => context.read<VendorCubit>().refreshVendors(),
      child: ListView.builder(
        itemCount: vendors.length,
        itemBuilder: (context, index) {
          final vendor = vendors[index];
          return VendorItem(vendor: vendor);
        },
      ),
    );
  }
}

