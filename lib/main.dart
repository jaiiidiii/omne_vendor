import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omne_vendor/core/ioc/ioc_manager.dart';
import 'package:omne_vendor/core/theme.dart';
import 'package:omne_vendor/logic/cubit/vendor_cubit.dart';
import 'package:omne_vendor/presentation/screens/vendor_search_screen.dart';

Future<void> main() async {
  await IocManager.register();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omne Vendor App Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   primarySwatch: Colors.blue,
      //   // ... define light theme properties
      // ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   primarySwatch: Colors.blue,
      //   // ... define dark theme properties
      // ),
      themeMode: ThemeMode.system, // Use the system's theme
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => getIt<VendorCubit>()..fetchVendors(),
        child: const VendorSearchScreen(),
      ),
    );
  }
}
