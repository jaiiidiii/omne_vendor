import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omne_vendor/presentation/bloc/vendor/vendor_cubit.dart';

import '../../mocks/mock_constants.dart';
import '../../mocks/mock_manager.dart';

void main() {
  late MockVendorRepository mockRepository;
  late VendorCubit vendorCubit;

  setUp(() {
    mockRepository = MockVendorRepository();
    vendorCubit = VendorCubit(mockRepository);
  });

  tearDown(() {
    vendorCubit.close();
  });

  group('VendorCubit', () {
    blocTest<VendorCubit, VendorState>(
      'emits [VendorLoading, VendorLoaded] when fetchVendors is called',
      build: () {
        when(
          () => mockRepository.getVendors(),
        ).thenAnswer((_) async => mockVendors);
        return vendorCubit;
      },
      act: (cubit) => cubit.fetchVendors(),
      expect: () => [
        VendorLoading(),
        VendorLoaded(vendors: mockVendors, filteredVendors: mockVendors),
      ],
    );

    blocTest<VendorCubit, VendorState>(
      'emits [VendorLoading, VendorLoaded] with a filtered list when filterVendors is called',
      build: () {
        return vendorCubit;
      },
      seed: () =>
          VendorLoaded(vendors: mockVendors, filteredVendors: mockVendors),
      act: (cubit) => cubit.filterVendors('alpha'),
      expect: () => [
        VendorLoading(),
        VendorLoaded(vendors: mockVendors, filteredVendors: [mockVendors[0]]),
      ],
    );

    blocTest<VendorCubit, VendorState>(
      'emits [VendorLoading, VendorError] when fetchVendors fails',
      build: () {
        when(
          () => mockRepository.getVendors(),
        ).thenThrow(Exception('API Error'));
        return vendorCubit;
      },
      act: (cubit) => cubit.fetchVendors(),
      expect: () => [VendorLoading(), VendorError('Exception: API Error')],
    );
  });
}
