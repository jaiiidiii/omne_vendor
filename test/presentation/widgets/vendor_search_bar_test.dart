import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omne_vendor/presentation/widgets/vendor_search_bar.dart';

import '../../mocks/mock_manager.dart';

void main() {
  late MockCallback mockCallback;

  setUp(() {
    mockCallback = MockCallback();
  });

  testWidgets('VendorSearchBar calls onChanged with a debounced delay', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: VendorSearchBar(onChanged: mockCallback.call)),
      ),
    );

    await tester.enterText(find.byType(TextField), 'test');

    await tester.pump(const Duration(milliseconds: 200));

    verifyNever(() => mockCallback.call('test'));

    await tester.pump(const Duration(milliseconds: 300));

    verify(() => mockCallback.call('test')).called(1);
  });
}
