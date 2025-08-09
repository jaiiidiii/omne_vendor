import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omne_vendor/data/models/vendor_model.dart';

abstract final class NavigationService {
  static void go(BuildContext context, String location, {Object? extra}) {
    context.go(location, extra: extra);
  }

  static void goNamed(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Object? extra,
  }) {
    context.goNamed(name, pathParameters: pathParameters, extra: extra);
  }

  static void goToVendorDetail(BuildContext context, VendorModel vendor) {
    goNamed(
      context,
      'vendorDetail',
      pathParameters: {'vendorId': vendor.vendorId.toString()},
      extra: vendor,
    );
  }
}
