import 'package:omne_vendor/domain/entities/vendor_model.dart';

abstract class VendorRepository {
  Future<List<VendorModel>> getVendors({bool forceRefresh = false});
  Future<void> addFavorite(VendorModel vendor);
  Future<void> removeFavorite(int vendorId);
  Future<List<VendorModel>> getFavorites();
}
