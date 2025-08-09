import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omne_vendor/core/ioc/ioc_manager.dart';
import 'package:omne_vendor/core/navigation/app_router.dart';
import 'package:omne_vendor/core/theme/themes.dart';
import 'package:omne_vendor/presentation/bloc/favorites/favorites_cubit.dart';
import 'package:omne_vendor/presentation/bloc/theme/theme_cubit.dart';
import 'package:omne_vendor/presentation/bloc/vendor/vendor_cubit.dart';

Future<void> main() async {
  await IocManager.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<VendorCubit>()..fetchVendors()),
        BlocProvider(
          create: (context) => getIt<FavoritesCubit>()..fetchFavorites(),
        ),
        BlocProvider(create: (context) => getIt<ThemeCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            title: 'Omne Vendor App Demo',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeState.themeMode,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
