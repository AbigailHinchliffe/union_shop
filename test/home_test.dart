import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/widgets/footer.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('should display home page with basic elements', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check that basic UI elements are present
      expect(
        find.text('PLACEHOLDER HEADER TEXT - STUDENTS TO UPDATE!'),
        findsOneWidget,
      );
      expect(find.text('Placeholder Hero Title'), findsOneWidget);
      expect(find.text('PLACEHOLDER PRODUCTS SECTION'), findsOneWidget);
      expect(find.text('BROWSE PRODUCTS'), findsOneWidget);
      expect(find.text('VIEW ALL PRODUCTS'), findsOneWidget);
    });

    testWidgets('should display product cards', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check that product cards are displayed
      expect(find.text('Placeholder Product 1'), findsOneWidget);
      expect(find.text('Placeholder Product 2'), findsOneWidget);
      expect(find.text('Placeholder Product 3'), findsOneWidget);
      expect(find.text('Placeholder Product 4'), findsOneWidget);

      // Check prices are displayed
      expect(find.text('£10.00'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
      expect(find.text('£20.00'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
    });

    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check that header icons are present
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check that Footer widget exists in the tree
      expect(find.byType(Footer), findsOneWidget);

      // Robust substring check for footer text (tolerant to spacing/newlines)
      final upsufinder = find.byWidgetPredicate(
        (widget) => widget is Text && (widget.data ?? '').toLowerCase().contains('@upsu'),
        description: 'Text widget containing "@upsu"',
      );
      expect(upsufinder, findsOneWidget);
    });
  });

  testWidgets('Footer shows office hours and @upsu text', (WidgetTester tester) async {
    // Provide Material and Scaffold so Footer's Material widgets and ScaffoldMessenger work.
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Footer())));
    await tester.pumpAndSettle();

    // Use substring checks so spacing/newlines don't break the test.
    final officeFinder = find.byWidgetPredicate(
      (w) => w is Text && (w.data ?? '').toLowerCase().contains('office hours'),
      description: 'Text containing "Office hours"',
    );
    final upsufinder = find.byWidgetPredicate(
      (w) => w is Text && (w.data ?? '').toLowerCase().contains('@upsu'),
      description: 'Text containing "@upsu"',
    );

    expect(officeFinder, findsOneWidget);
    expect(upsufinder, findsOneWidget);
  });
}
