import 'dart:convert';

import 'package:omne_vendor/data/services/database_helper.dart';
import 'package:omne_vendor/data/services/vendor_api_service.dart';
import 'package:omne_vendor/domain/entities/vendor_model.dart';
import 'package:omne_vendor/domain/repositories/vendor_repository.dart';

class MockVendorRepository implements VendorRepository {
  final VendorApiService _apiService;
  final DatabaseHelper _databaseHelper;

  MockVendorRepository(this._apiService, this._databaseHelper);

  @override
  Future<List<VendorModel>> getVendors({bool forceRefresh = false}) async {
    // Check for cached data first
    final cachedVendors = await _databaseHelper.getVendors();
    if (!forceRefresh && cachedVendors.isNotEmpty) {
      return cachedVendors;
    }
    // Otherwise, fetch from API
    try {
      final String jsonResponse = await _apiService.fetchVendors();

      final List<dynamic> jsonList = jsonDecode(jsonResponse);

      final vendors = jsonList
          .map((json) => VendorModel.fromJson(json as Map<String, dynamic>))
          .toList();

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

  @override
  Future<void> addFavorite(VendorModel vendor) async {
    return _databaseHelper.addFavorite(vendor);
  }

  @override
  Future<void> removeFavorite(int vendorId) async {
    return _databaseHelper.removeFavorite(vendorId);
  }

  @override
  Future<List<VendorModel>> getFavorites() async {
    return _databaseHelper.getFavorites();
  }
}
