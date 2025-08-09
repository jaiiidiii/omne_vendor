import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omne_vendor/data/models/vendor_model.dart';
import 'package:omne_vendor/data/repositories/vendor_repository.dart';

part 'vendor_state.dart';

class VendorCubit extends Cubit<VendorState> {
  final VendorRepository _repository;

  VendorCubit(this._repository) : super(VendorInitial());

  Future<void> fetchVendors() async {
    try {
      emit(VendorLoading());
      final vendors = await _repository.getVendors();
      emit(VendorLoaded(vendors: vendors, filteredVendors: vendors));
    } catch (e) {
      emit(VendorError(e.toString()));
    }
  }

  Future<void> refreshVendors() async {
    if (state is VendorLoaded) {
      try {
        final vendors = await _repository.getVendors(forceRefresh: true);
        emit(VendorLoaded(vendors: vendors, filteredVendors: vendors));
      } catch (e) {
        emit(VendorError(e.toString()));
      }
    }
  }

  Future<void> filterVendors(String query) async {
    final currentState = state;
    if (currentState is! VendorLoaded) {
      return;
    }
    emit(VendorLoading());
    await Future.delayed(Duration(seconds: 1));

    final allVendors = currentState.vendors;
    final filteredList = allVendors.where((vendor) {
      final vendorName = vendor.name.toLowerCase();
      final searchQuery = query.toLowerCase();
      return vendorName.contains(searchQuery);
    }).toList();

    emit(VendorLoaded(vendors: allVendors, filteredVendors: filteredList));
  }
}
