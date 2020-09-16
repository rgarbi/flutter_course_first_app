// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_content.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Color Changes when card is active', (WidgetTester tester) async {
    await tester.pumpWidget(ReusableCard());
    expect(kActiveCardColor, ReusableCard(isActive: true).color);
    expect(kInactiveCardColor, ReusableCard(isActive: false).color);
  });
}
