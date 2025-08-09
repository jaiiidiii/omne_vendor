import 'package:get_it/get_it.dart';
import 'package:omne_vendor/data/repositories/vendor_repository.dart';
import 'package:omne_vendor/data/services/database_helper.dart';
import 'package:omne_vendor/data/services/vendor_api_service.dart';
import 'package:omne_vendor/logic/cubit/favorites/favorites_cubit.dart';
import 'package:omne_vendor/logic/cubit/theme/theme_cubit.dart';
import 'package:omne_vendor/logic/cubit/vendor/vendor_cubit.dart';

final GetIt getIt = GetIt.instance;

class IocManager {
  static Future<void> register() async {
    // Services
    getIt.registerLazySingleton<VendorApiService>(() => VendorApiService());
    getIt.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

    // Repository
    getIt.registerLazySingleton<VendorRepository>(
      () =>
          VendorRepository(getIt<VendorApiService>(), getIt<DatabaseHelper>()),
    );

    // Cubits
    getIt.registerFactory<VendorCubit>(
      () => VendorCubit(getIt<VendorRepository>()),
    );
    getIt.registerFactory<FavoritesCubit>(
      () => FavoritesCubit(getIt<VendorRepository>()),
    );
    getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  }
}
