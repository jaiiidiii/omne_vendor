import 'package:omne_vendor/data/models/vendor_model.dart';
import 'package:omne_vendor/data/services/vendor_api_service.dart';

class VendorRepository {
  final VendorApiService _apiService;

  VendorRepository(this._apiService);

  Future<List<VendorModel>> getVendors() async {
    try {
      return await _apiService.fetchVendors();
    } catch (e) {
      // Proper error handling
      throw Exception('Failed to load vendors');
    }
  }
}