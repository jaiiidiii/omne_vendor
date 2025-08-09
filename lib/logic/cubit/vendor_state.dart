part of 'vendor_cubit.dart';

abstract class VendorState extends Equatable {
  const VendorState();

  @override
  List<Object> get props => [];
}

class VendorInitial extends VendorState {}

class VendorLoading extends VendorState {}

class VendorLoaded extends VendorState {
  final List<VendorModel> vendors;
  final List<VendorModel> filteredVendors;

  const VendorLoaded({
    required this.vendors,
    required this.filteredVendors,
  });

  @override
  List<Object> get props => [vendors, filteredVendors];
}

class VendorError extends VendorState {
  final String message;

  const VendorError(this.message);

  @override
  List<Object> get props => [message];
}