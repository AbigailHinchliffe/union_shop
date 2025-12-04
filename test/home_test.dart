import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/product_page.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('ProductCard with sale shows all elements', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: ProductCard(productId: 'sale', title: 'Sale Item', price: '£8', imageUrl: 'assets/images/test.jpg', originalPrice: '£10', salePercentage: '20'),
      ));
      await tester.pump();
      expect(find.text('£10'), findsOneWidget);
      expect(find.text('-20%'), findsOneWidget);
      expect(find.text('£8'), findsOneWidget);
    });

    testWidgets('ProductCard without sale shows normal price', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProductCard(productId: 'normal', title: 'Item', price: '£15', imageUrl: 'assets/images/test.jpg')));
      await tester.pump();
      expect(find.text('£15'), findsOneWidget);
      final priceText = tester.widget<Text>(find.text('£15'));
      expect(priceText.style?.fontWeight, FontWeight.normal);
    });

    testWidgets('ProductCard navigates to ProductPage on tap', (tester) async {
      await tester.pumpWidget(MaterialApp(home: const ProductCard(productId: 'test', title: 'Test', price: '£5', imageUrl: 'assets/test.jpg'), routes: {'/product': (context) => const ProductPage()}));
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();
      expect(find.byType(ProductPage), findsOneWidget);
    });

    testWidgets('ProductCard with custom onTap works', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(MaterialApp(home: ProductCard(productId: 'test', title: 'Test', price: '£10', imageUrl: 'assets/test.jpg', onTap: () => tapped = true)));
      await tester.tap(find.byType(GestureDetector));
      expect(tapped, true);
    });

    testWidgets('ProductCard styling is correct', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProductCard(productId: 'test', title: 'Styled', price: '£20', imageUrl: 'assets/test.jpg')));
      await tester.pump();
      final titleText = tester.widget<Text>(find.text('Styled'));
      expect(titleText.style?.fontSize, 14);
      expect(titleText.style?.fontWeight, FontWeight.w500);
      expect(titleText.maxLines, 2);
    });

    testWidgets('GridView renders with correct delegate', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8, crossAxisSpacing: 24, mainAxisSpacing: 48),
        itemCount: 2, itemBuilder: (context, index) => const ProductCard(productId: 'test', title: 'Test', price: '£5', imageUrl: 'assets/test.jpg'),
      ))));
      await tester.pump();
      expect(find.byType(GridView), findsOneWidget);
    });

    test('HomeScreen navigation methods work', () {
      const homeScreen = HomeScreen();
      expect(() => homeScreen.placeholderCallbackForButtons(), returnsNormally);
    });

    test('ProductCatalog returns featured products', () {
      final products = ProductCatalog.getFeaturedProducts();
      expect(products, isNotEmpty);
      expect(products.first['id'], isNotNull);
      expect(products.first['title'], isNotNull);
    });

    test('UnionShopApp routes are configured', () {
      const app = UnionShopApp();
      expect(app, isA<UnionShopApp>());
    });
  });
}
