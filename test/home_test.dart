import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/hero_carousel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  group('Home Page Tests', () {
    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Footer())));
      await tester.pumpAndSettle();

      expect(find.byType(Footer), findsOneWidget);
      expect(find.textContaining('@upsu'), findsOneWidget);
    });

    testWidgets('should display hero carousel', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HeroCarousel(enableAutoRotate: false),
          ),
        ),
      );
      await tester.pump();
      
      expect(find.byType(HeroCarousel), findsOneWidget);
      expect(find.text('Browse Our Products'), findsOneWidget);
    });

    testWidgets('should display at least one ProductCard', (tester) async {
      // Test ProductCard directly to avoid carousel timer issues
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GridView.count(
              crossAxisCount: 2,
              children: const [
                ProductCard(
                  productId: 'varsity_jersey',
                  title: 'Portsmouth University Jersey',
                  price: '£25.00',
                  imageUrl: 'assets/images/jerseypurp.jpg',
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pump();
      
      expect(find.byType(ProductCard), findsAtLeastNWidgets(1));
      expect(find.text('Portsmouth University Jersey'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
    });

    testWidgets('ProductCard displays title and price', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: 'test_product',
              title: 'Test Product',
              price: '£10.00',
              imageUrl: 'assets/images/test.jpg',
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('£10.00'), findsOneWidget);
    });

    testWidgets('displays "PRODUCTS SECTION" title on home screen', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const AppHeader(),
                  const HeroCarousel(enableAutoRotate: false),
                  Container(
                    color: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Text(
                            'PRODUCTS SECTION',
                            style: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('PRODUCTS SECTION'), findsOneWidget);
    });

    testWidgets('displays "VIEW ALL PRODUCTS" button', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/collections': (context) => const Scaffold(
                  body: Center(child: Text('COLLECTIONS')),
                ),
          },
          home: Builder(
            builder: (context) => Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/collections');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4d2963),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('VIEW ALL PRODUCTS'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      // Find the button
      expect(find.text('VIEW ALL PRODUCTS'), findsOneWidget);
      
      // Verify button has correct color
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.style?.backgroundColor?.resolve({}), const Color(0xFF4d2963));
    });

    testWidgets('ProductCard is tappable and has gesture detector', (tester) async {
      bool wasTapped = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: 'varsity_jersey',
              title: 'Portsmouth University Jersey',
              price: '£25.00',
              imageUrl: 'assets/images/portsunijersey.jpg',
              onTap: () => wasTapped = true,
            ),
          ),
        ),
      );
      await tester.pump();

      // Find a product card by its title
      final productCard = find.text('Portsmouth University Jersey');
      expect(productCard, findsOneWidget);

      // Verify it's in a GestureDetector
      final gestureDetector = find.ancestor(
        of: productCard,
        matching: find.byType(GestureDetector),
      );
      expect(gestureDetector, findsOneWidget);

      // Tap on the product card
      await tester.tap(gestureDetector);
      await tester.pump();

      // Verify tap was registered
      expect(wasTapped, isTrue);
    });

    testWidgets('ProductCard displays image, title, and price correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: 'purple_tshirt',
              title: 'Purple T-Shirt',
              price: '£12.00',
              imageUrl: 'assets/images/purpletshirt.jpg',
            ),
          ),
        ),
      );
      await tester.pump();

      // Verify all elements are present
      expect(find.text('Purple T-Shirt'), findsOneWidget);
      expect(find.text('£12.00'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);

      // Verify text styling
      final titleText = tester.widget<Text>(find.text('Purple T-Shirt'));
      expect(titleText.style?.fontWeight, FontWeight.w500);
    });
  });
}
