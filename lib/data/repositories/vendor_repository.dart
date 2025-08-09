import 'package:omne_vendor/data/models/vendor_model.dart';
import 'package:omne_vendor/data/services/database_helper.dart';
import 'package:omne_vendor/data/services/vendor_api_service.dart';

class VendorRepository {
  final VendorApiService _apiService;
  final DatabaseHelper _databaseHelper;

  VendorRepository(this._apiService, this._databaseHelper);

  Future<List<VendorModel>> getVendors({bool forceRefresh = false}) async {
    // Check for cached data first
    final cachedVendors = await _databaseHelper.getVendors();
    if (!forceRefresh && cachedVendors.isNotEmpty) {
      return cachedVendors;
    }
    // Otherwise, fetch from API
    try {
      final vendors = await _apiService.fetchVendors();
      await _databaseHelper.insertVendors(vendors);
      return vendors;
    } catch (e) {
      // If API fails, return cached data if available
      if (cachedVendors.isNotEmpty) {
        return cachedVendors;
      }
      throw Exception('Failed to load vendors from API or cache');
    }
  }

  Future<void> addFavorite(VendorModel vendor) async {
    return _databaseHelper.addFavorite(vendor);
  }

  Future<void> removeFavorite(int vendorId) async {
    return _databaseHelper.removeFavorite(vendorId);
  }

  Future<List<VendorModel>> getFavorites() async {
    return _databaseHelper.getFavorites();
  }
}
