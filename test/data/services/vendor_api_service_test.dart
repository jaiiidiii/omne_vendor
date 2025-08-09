import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:omne_vendor/data/services/vendor_api_service.dart';

void main() {
  late VendorApiService apiService;

  setUp(() {
    apiService = VendorApiService();
  });

  test('fetchVendors returns a Future<String> which is a valid JSON array', () async {
    final result = await apiService.fetchVendors();

    // Verify the return type is a String
    expect(result, isA<String>());

    // Verify the string is a valid JSON array
    final decoded = jsonDecode(result);
    expect(decoded, isA<List>());
    expect(decoded, isNotEmpty);
  });
}