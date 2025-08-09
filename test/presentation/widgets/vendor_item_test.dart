import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:omne_vendor/presentation/widgets/vendor_item.dart';

import '../../mocks/mock_constants.dart';

void main() {
  testWidgets(
    'VendorItem calls onToggleFavorite when favorite icon is tapped',
    (WidgetTester tester) async {
      bool favoriteToggled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: VendorItem(
            vendor: mockVendor,
            isFavorite: false,
            onToggleFavorite: () {
              favoriteToggled = true;
            },
          ),
        ),
      );
      await tester.tap(find.byIcon(Icons.favorite_border));
      await tester.pump();
      expect(favoriteToggled, isTrue);
    },
  );
}
