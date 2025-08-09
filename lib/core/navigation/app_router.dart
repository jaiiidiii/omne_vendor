import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omne_vendor/core/navigation/routes.dart';
import 'package:omne_vendor/domain/entities/vendor_model.dart';
import 'package:omne_vendor/presentation/screens/vendor_detail_screen.dart';
import 'package:omne_vendor/presentation/screens/vendor_search_screen.dart';

final class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.vendorSearch,
    routes: [
      GoRoute(
        path: AppRoutes.vendorSearch,
        name: 'vendorSearch',
        builder: (BuildContext context, GoRouterState state) =>
            const VendorSearchScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.vendorDetail,
            name: 'vendorDetail',
            builder: (BuildContext context, GoRouterState state) {
              final VendorModel? vendor = state.extra as VendorModel?;
              if (vendor == null) {
                return const Scaffold(
                  body: Center(child: Text('Vendor not found!')),
                );
              }
              return VendorDetailScreen(vendor: vendor);
            },
          ),
        ],
      ),
    ],
  );
}
