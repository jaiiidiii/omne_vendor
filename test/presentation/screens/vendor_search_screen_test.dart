import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omne_vendor/presentation/bloc/favorites/favorites_cubit.dart';
import 'package:omne_vendor/presentation/bloc/theme/theme_cubit.dart';
import 'package:omne_vendor/presentation/bloc/vendor/vendor_cubit.dart';
import 'package:omne_vendor/presentation/screens/vendor_search_screen.dart';
import 'package:omne_vendor/presentation/widgets/no_results.dart';
import 'package:omne_vendor/presentation/widgets/vendor_item.dart';
import 'package:omne_vendor/presentation/widgets/vendor_search_bar.dart';

import '../../mocks/mock_constants.dart';
import '../../mocks/mock_manager.dart';

void main() {
  late MockVendorCubit mockVendorCubit;
  late MockFavoritesCubit mockFavoritesCubit;
  late MockThemeCubit mockThemeCubit;

  setUp(() {
    mockVendorCubit = MockVendorCubit();
    mockFavoritesCubit = MockFavoritesCubit();
    mockThemeCubit = MockThemeCubit();
  });

  Widget createWidgetUnderTest() {
    whenListen(
      mockFavoritesCubit,
      Stream.value(FavoritesLoaded([])),
      initialState: FavoritesLoaded([]),
    );
    whenListen(
      mockThemeCubit,
      Stream.value(const ThemeState(ThemeMode.light)),
      initialState: const ThemeState(ThemeMode.light),
    );

    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<VendorCubit>.value(value: mockVendorCubit),
          BlocProvider<FavoritesCubit>.value(value: mockFavoritesCubit),
          BlocProvider<ThemeCubit>.value(value: mockThemeCubit),
        ],
        child: const VendorSearchScreen(),
      ),
    );
  }

  group('VendorSearchScreen', () {
    testWidgets('shows loading indicator when state is VendorLoading', (
      WidgetTester tester,
    ) async {
      whenListen(
        mockVendorCubit,
        Stream.value(VendorLoading()),
        initialState: VendorInitial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows vendors when state is VendorLoaded with results', (
      WidgetTester tester,
    ) async {
      whenListen(
        mockVendorCubit,
        Stream.fromIterable([
          VendorLoaded(vendors: mockVendors, filteredVendors: mockVendors),
        ]),
        initialState: VendorInitial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(VendorItem), findsNWidgets(mockVendors.length));
    });

    testWidgets(
      'shows NoResultsWidget when state is VendorLoaded with an empty list',
      (WidgetTester tester) async {
        whenListen(
          mockVendorCubit,
          Stream.fromIterable([VendorLoaded(vendors: [], filteredVendors: [])]),
          initialState: VendorInitial(),
        );

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        expect(find.byType(NoResultsWidget), findsOneWidget);
      },
    );

    testWidgets('shows error message when state is VendorError', (
      WidgetTester tester,
    ) async {
      whenListen(
        mockVendorCubit,
        Stream.fromIterable([const VendorError('Error occurred')]),
        initialState: VendorInitial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.textContaining('Error occurred'), findsOneWidget);
    });

    testWidgets(
      'calls filterVendors on VendorCubit when search query changes',
      (WidgetTester tester) async {
        whenListen(
          mockVendorCubit,
          Stream.value(
            VendorLoaded(vendors: mockVendors, filteredVendors: mockVendors),
          ),
          initialState: VendorInitial(),
        );
        when(
          () => mockVendorCubit.filterVendors(any()),
        ).thenAnswer((_) async {});

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        final textFieldFinder = find.byType(VendorSearchBar);
        expect(textFieldFinder, findsOneWidget);

        const testQuery = 'alpha';
        await tester.enterText(find.byType(TextField), testQuery);
        await tester.pumpAndSettle();

        verify(() => mockVendorCubit.filterVendors(testQuery)).called(1);
      },
    );
  });
}
