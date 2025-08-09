import 'package:equatable/equatable.dart';
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

  void filterVendors(String query) {
    if (state is VendorLoaded) {
      final loadedState = state as VendorLoaded;
      final filteredList = loadedState.vendors.where((vendor) {
        return vendor.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      emit(
        VendorLoaded(
          vendors: loadedState.vendors,
          filteredVendors: filteredList,
        ),
      );
    }
  }

    Future<void> refreshVendors() async {
    await fetchVendors();
  }
}