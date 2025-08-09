import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:omne_vendor/presentation/screens/vendor_detail_screen.dart';

import '../../mocks/mock_constants.dart';

void main() {
  group('VendorDetailScreen', () {
    testWidgets('displays vendor details correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          // Hero animations require a Navigator to be present.
          home: VendorDetailScreen(vendor: mockVendor),
        ),
      );

      // Wait for all animations and frames to settle.
      await tester.pump();

      // Verify that all text widgets display correct vendor info.
      expect(find.text(mockVendor.name), findsOneWidget);
      expect(find.text(mockVendor.rating.toStringAsFixed(1)), findsOneWidget);
      expect(find.text(mockVendor.category), findsOneWidget);
      expect(find.text(mockVendor.location), findsOneWidget);

      // Verify Hero widgets are present with correct tags.
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Hero &&
              widget.tag == 'vendor-image-${mockVendor.vendorId}',
        ),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Hero &&
              widget.tag == 'vendor-name-${mockVendor.vendorId}',
        ),
        findsOneWidget,
      );
    });
  });
}
