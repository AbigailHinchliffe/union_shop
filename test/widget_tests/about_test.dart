import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/about_us.dart';
import 'package:union_shop/widgets/appshell.dart';

void main() {
  group('AboutUs Page Tests', () {
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

    testWidgets('AboutUs page uses Appshell wrapper', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutUs()));
      await tester.pumpAndSettle();

      expect(find.byType(Appshell), findsOneWidget);
    });

    testWidgets('AboutUs page has scrollable content', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutUs()));
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsWidgets);
    });

    testWidgets('AboutUs title has correct styling', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutUs()));
      await tester.pumpAndSettle();

      final titleWidget = tester.widget<Text>(
        find.text('About Us'),
      );

      expect(titleWidget.style?.fontSize, 20);
      expect(titleWidget.style?.fontWeight, FontWeight.bold);
      expect(titleWidget.textAlign, TextAlign.center);
    });

    testWidgets('AboutUs body contains key information', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutUs()));
      await tester.pumpAndSettle();

      // Check for key content
      expect(find.textContaining('Welcome to our store'), findsOneWidget);
      expect(find.textContaining('University branded products'), findsOneWidget);
      expect(find.textContaining('delivery or collection'), findsOneWidget);
      expect(find.textContaining('Union Shop Team'), findsOneWidget);
    });

    testWidgets('AboutUs page has proper layout structure', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutUs()));
      await tester.pumpAndSettle();

      // Verify Column structure
      expect(find.byType(Column), findsWidgets);
      
      // Verify padding
      expect(find.byType(Padding), findsWidgets);
      
      // Verify Center widget for content
      expect(find.byType(Center), findsWidgets);
    });

    testWidgets('AboutUs page has SizedBox for spacing', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutUs()));
      await tester.pumpAndSettle();

      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('AboutUs body text uses correct text alignment', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutUs()));
      await tester.pumpAndSettle();

      final bodyTextWidget = tester.widget<Text>(
        find.textContaining('Welcome to our store'),
      );

      expect(bodyTextWidget.textAlign, TextAlign.left);
    });
  });
}