import 'package:get_it/get_it.dart';
import 'package:omne_vendor/data/repositories/vendor_repository.dart';
import 'package:omne_vendor/data/services/vendor_api_service.dart';
import 'package:omne_vendor/logic/cubit/vendor_cubit.dart';

final GetIt getIt = GetIt.instance;

class IocManager {
  static Future<void> register() async {
    getIt.registerLazySingleton<VendorApiService>(() => VendorApiService());
    getIt.registerLazySingleton<VendorRepository>(
      () => VendorRepository(getIt<VendorApiService>()),
    );
    getIt.registerFactory<VendorCubit>(
      () => VendorCubit(getIt<VendorRepository>()),
    );

    // Injector.i.registerLazySingleton<VendorApiService>(() => VendorApiService())
    // ..registerLazySingleton<VendorRepository>(
    //   () => VendorRepository(getIt<VendorApiService>()),
    // )
    // ..registerFactory<VendorCubit>(
    //   () => VendorCubit(getIt<VendorRepository>()),
    // );
  }
}
