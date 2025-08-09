import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omne_vendor/presentation/bloc/favorites/favorites_cubit.dart';

import '../../mocks/mock_constants.dart';
import '../../mocks/mock_manager.dart';

void main() {
  late MockVendorRepository mockRepository;
  late FavoritesCubit favoritesCubit;

  setUpAll(() {
    registerFallbackValue(MockVendorModel());
  });

  setUp(() {
    mockRepository = MockVendorRepository();
    favoritesCubit = FavoritesCubit(mockRepository);
  });

  tearDown(() {
    favoritesCubit.close();
  });

  group('FavoritesCubit', () {
    blocTest<FavoritesCubit, FavoritesState>(
      'emits [FavoritesLoading, FavoritesLoaded] with favorites when fetchFavorites is called',
      build: () {
        when(
          () => mockRepository.getFavorites(),
        ).thenAnswer((_) async => mockVendors);
        return favoritesCubit;
      },
      act: (cubit) async => await cubit.fetchFavorites(),
      expect: () => [FavoritesLoading(), FavoritesLoaded(mockVendors)],
    );

    blocTest<FavoritesCubit, FavoritesState>(
      'removes an existing favorite and emits [FavoritesLoaded] without it',
      build: () {
        when(
          () => mockRepository.getFavorites(),
        ).thenAnswer((_) async => [mockVendors[0]]);

        when(
          () => mockRepository.removeFavorite(mockVendors[0].vendorId),
        ).thenAnswer((_) async {
          when(() => mockRepository.getFavorites()).thenAnswer((_) async => []);
        });

        return favoritesCubit;
      },
      act: (cubit) async {
        await cubit.fetchFavorites();
        await cubit.toggleFavorite(mockVendors[0]);
      },
      expect: () => [
        FavoritesLoading(),
        FavoritesLoaded([mockVendors[0]]),
        FavoritesLoading(),
        FavoritesLoaded([]),
      ],
    );
  });
}
