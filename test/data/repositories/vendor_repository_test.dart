import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omne_vendor/data/repositories/vendor_repository_impl.dart'
    as vendor_repo;

import 'package:omne_vendor/domain/repositories/vendor_repository.dart';

import '../../mocks/mock_constants.dart';
import '../../mocks/mock_manager.dart';

void main() {
  late MockVendorApiService mockApiService;
  late MockDatabaseHelper mockDatabaseHelper;
  late VendorRepository repository;

  setUp(() {
    mockApiService = MockVendorApiService();
    mockDatabaseHelper = MockDatabaseHelper();
    repository = vendor_repo.MockVendorRepository(
      mockApiService,
      mockDatabaseHelper,
    );
  });

  group('VendorRepository', () {
    test(
      'getVendors returns vendors from API and caches them if cache is empty',
      () async {
        final mockApiResponse = jsonEncode(
          mockVendors.map((vendor) => vendor.toJson()).toList(),
        );

        when(() => mockDatabaseHelper.getVendors()).thenAnswer((_) async => []);
        when(
          () => mockApiService.fetchVendors(),
        ).thenAnswer((_) async => mockApiResponse);
        when(
          () => mockDatabaseHelper.insertVendors(any()),
        ).thenAnswer((_) async {});

        final result = await repository.getVendors();

        expect(result, mockVendors);
        verify(() => mockDatabaseHelper.getVendors()).called(1);
        verify(() => mockApiService.fetchVendors()).called(1);
        verify(() => mockDatabaseHelper.insertVendors(any())).called(1);
      },
    );

    test('getVendors returns cached data and does not call API', () async {
      when(
        () => mockDatabaseHelper.getVendors(),
      ).thenAnswer((_) async => mockVendors);

      final result = await repository.getVendors();

      expect(result, mockVendors);
      verifyNever(() => mockApiService.fetchVendors());
      verify(() => mockDatabaseHelper.getVendors()).called(1);
    });
  });
}
