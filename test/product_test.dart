import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/widgets/appshell.dart';

void main() {
  group('Product Page Tests', () {
    testWidgets('displays product with valid ID from catalog', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) {
            return Navigator(
              onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => const ProductPage(),
                settings: const RouteSettings(arguments: 'purple_tshirt'),
              ),
            );
          },
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.textContaining('Purple T-Shirt'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
    });

    testWidgets('displays Product Not Found for invalid ID', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) {
            return Navigator(
              onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => const ProductPage(),
                settings: const RouteSettings(arguments: 'invalid_id'),
              ),
            );
          },
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Product Not Found'), findsOneWidget);
    });

    testWidgets('uses Appshell wrapper', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProductPage()));
      await tester.pumpAndSettle();
      expect(find.byType(Appshell), findsOneWidget);
    });

    testWidgets('has back button', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProductPage()));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.text('Back'), findsOneWidget);
    });

    testWidgets('displays Add to Cart button', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProductPage()));
      await tester.pumpAndSettle();
      expect(find.text('ADD TO CART'), findsOneWidget);
      expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
    });

    testWidgets('Add to Cart button is tappable', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) {
            return Navigator(
              onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => const ProductPage(),
                settings: const RouteSettings(arguments: 'purple_tshirt'),
              ),
            );
          },
        ),
      ));
      await tester.pumpAndSettle();
      
      final button = find.text('ADD TO CART');
      expect(button, findsOneWidget);
      await tester.ensureVisible(button);
      await tester.tap(button, warnIfMissed: false);
      await tester.pump();
    });

    testWidgets('displays product image', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProductPage()));
      await tester.pumpAndSettle();
      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('has Description section', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProductPage()));
      await tester.pumpAndSettle();
      expect(find.text('Description'), findsOneWidget);
    });

    testWidgets('ProductCatalog returns products', (tester) async {
      final product = ProductCatalog.getProductById('purple_tshirt');
      expect(product, isNotNull);
      expect(product!['title'], 'Purple T-Shirt');
      expect(product['price'], '£15.00');
    });

    testWidgets('ProductCatalog filters by collection', (tester) async {
      final essentials = ProductCatalog.getProductsByCollection('Essentials');
      expect(essentials.isNotEmpty, true);
      expect(essentials.every((p) => p['collection'] == 'Essentials'), true);
    });

    testWidgets('ProductCatalog returns all products', (tester) async {
      final all = ProductCatalog.getAllProducts();
      expect(all.length, greaterThan(5));
    });

    testWidgets('ProductCatalog has sale items with originalPrice and salePercentage', (tester) async {
      // Test that sale items exist in the catalog with required fields
      final saleProducts = ProductCatalog.getProductsByCollection('Sale');
      expect(saleProducts.length, greaterThan(0));
      
      for (final product in saleProducts) {
        expect(product['originalPrice'], isNotNull, reason: '${product['title']} should have originalPrice');
        expect(product['salePercentage'], isNotNull, reason: '${product['title']} should have salePercentage');
        expect(product['price'], isNotNull, reason: '${product['title']} should have sale price');
      }

      // Verify specific sale items
      final stylus = ProductCatalog.getProductById('stylus_pen');
      expect(stylus?['originalPrice'], '£7.00');
      expect(stylus?['salePercentage'], '20');
      expect(stylus?['price'], '£5.60');

      final gloves = ProductCatalog.getProductById('black_gloves');
      expect(gloves?['originalPrice'], '£10.00');
      expect(gloves?['salePercentage'], '25');
      expect(gloves?['price'], '£7.50');

      final beanie = ProductCatalog.getProductById('white_beanie');
      expect(beanie?['originalPrice'], '£12.00');
      expect(beanie?['salePercentage'], '20');
      expect(beanie?['price'], '£9.60');
    });
  });
}
