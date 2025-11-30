import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/about_us.dart';

void main() {
  testWidgets('AboutUs page renders title and content', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AboutUs()));
    await tester.pumpAndSettle();

    final titleFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Text &&
          (widget.data ?? '').toLowerCase().contains('about us'.toLowerCase()),
    );

    final bodyFinder = find.byWidgetPredicate(
      (widget) => widget is Text && (widget.data ?? '').contains('University'),
    );

    expect(find.byType(AboutUs), findsOneWidget);
    expect(titleFinder, findsOneWidget, reason: 'Expected an "about us" title to be present');
    expect(bodyFinder, findsOneWidget, reason: 'Expected body text containing "University"');
  });
}