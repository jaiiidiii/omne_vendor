import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omne_vendor/data/services/database_helper.dart';
import 'package:omne_vendor/data/services/vendor_api_service.dart';
import 'package:omne_vendor/domain/entities/vendor_model.dart';
import 'package:omne_vendor/domain/repositories/vendor_repository.dart';
import 'package:omne_vendor/presentation/bloc/favorites/favorites_cubit.dart';
import 'package:omne_vendor/presentation/bloc/theme/theme_cubit.dart';
import 'package:omne_vendor/presentation/bloc/vendor/vendor_cubit.dart';

class MockVendorApiService extends Mock implements VendorApiService {}

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

class MockVendorRepository extends Mock implements VendorRepository {}

class MockVendorCubit extends MockCubit<VendorState> implements VendorCubit {}

class MockFavoritesCubit extends MockCubit<FavoritesState>
    implements FavoritesCubit {}

class MockThemeCubit extends MockCubit<ThemeState> implements ThemeCubit {}

class MockVendorModel extends Mock implements VendorModel {}

class MockNavigationService extends Mock {
  void goToVendorDetail(context, vendor);
}

class MockCallback extends Mock {
  void call(String query);
}
