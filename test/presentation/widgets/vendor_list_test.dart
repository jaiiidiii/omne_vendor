import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omne_vendor/domain/entities/vendor_model.dart';
import 'package:omne_vendor/presentation/bloc/favorites/favorites_cubit.dart';
import 'package:omne_vendor/presentation/bloc/vendor/vendor_cubit.dart';
import 'package:omne_vendor/presentation/widgets/no_results.dart';
import 'package:omne_vendor/presentation/widgets/vendor_item.dart';
import 'package:omne_vendor/presentation/widgets/vendor_list.dart';

import '../../mocks/mock_constants.dart';
import '../../mocks/mock_manager.dart';

void main() {
  late MockVendorCubit mockVendorCubit;
  late MockFavoritesCubit mockFavoritesCubit;

  setUpAll(() {
    registerFallbackValue(MockVendorModel());
  });

  setUp(() {
    mockVendorCubit = MockVendorCubit();
    mockFavoritesCubit = MockFavoritesCubit();
  });

  Widget createWidgetUnderTest(List<VendorModel> vendors) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<FavoritesCubit>.value(value: mockFavoritesCubit),
          BlocProvider<VendorCubit>.value(value: mockVendorCubit),
        ],
        child: Scaffold(body: VendorList(vendors: vendors)),
      ),
    );
  }

  group('VendorList Tests', () {
    testWidgets('displays NoResultsWidget when vendors list is empty', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest([]));

      expect(find.byType(NoResultsWidget), findsOneWidget);
      expect(find.byType(VendorItem), findsNothing);
    });

    testWidgets(
      'displays a list of vendors when not empty and favorites are loaded',
      (WidgetTester tester) async {
        whenListen(
          mockFavoritesCubit,
          Stream.fromIterable([
            FavoritesLoaded([mockVendors[0]]),
          ]),
          initialState: FavoritesLoaded([]),
        );
        when(() => mockVendorCubit.refreshVendors()).thenAnswer((_) async {});

        await tester.pumpWidget(createWidgetUnderTest(mockVendors));
        await tester.pumpAndSettle();

        expect(find.byType(VendorItem), findsNWidgets(mockVendors.length));

        final firstVendorItem = find.byType(VendorItem).first;
        expect(
          find.descendant(
            of: firstVendorItem,
            matching: find.byIcon(Icons.favorite),
          ),
          findsOneWidget,
        );

        final secondVendorItem = find.byType(VendorItem).at(1);
        expect(
          find.descendant(
            of: secondVendorItem,
            matching: find.byIcon(Icons.favorite_border),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'calls refreshVendors on VendorCubit when a pull-to-refresh is triggered',
      (WidgetTester tester) async {
        whenListen(
          mockFavoritesCubit,
          Stream.fromIterable([FavoritesLoaded([])]),
          initialState: FavoritesLoaded([]),
        );
        when(() => mockVendorCubit.refreshVendors()).thenAnswer((_) async {});

        await tester.pumpWidget(createWidgetUnderTest(mockVendors));
        await tester.pumpAndSettle();

        await tester.fling(
          find.byType(VendorList),
          const Offset(0.0, 300.0),
          1000.0,
        );
        await tester.pumpAndSettle();

        verify(() => mockVendorCubit.refreshVendors()).called(1);
      },
    );
  });
}
