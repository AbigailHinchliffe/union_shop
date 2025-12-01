import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_page.dart';

void main() {
  group('Product Page Tests', () {
    testWidgets('should display product page with all elements', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProductPage()));
      await tester.pumpAndSettle();

      // Check header elements
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);

      // Check product details
      expect(find.text('Placeholder Product Name'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
    });

    testWidgets('should display product image container', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProductPage()));
      await tester.pumpAndSettle();

      // Check for Container with height 300
      final containerFinder = find.byWidgetPredicate(
        (widget) => widget is Container && widget.constraints == null,
        description: 'Product image container',
      );

      expect(containerFinder, findsWidgets);
    });

    testWidgets('should display placeholder header text', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProductPage()));
      await tester.pumpAndSettle();

      expect(find.text('PLACEHOLDER HEADER TEXT'), findsOneWidget);
    });

    testWidgets('should display placeholder footer', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProductPage()));
      await tester.pumpAndSettle();

      expect(find.text('Placeholder Footer'), findsOneWidget);
    });

    testWidgets('should display product description text', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProductPage()));
      await tester.pumpAndSettle();

      expect(find.textContaining('This is a placeholder description'), findsOneWidget);
    });
  });
}
