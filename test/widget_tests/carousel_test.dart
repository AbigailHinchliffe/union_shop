import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/hero_carousel.dart';

void main() {
  group('HeroCarousel Tests', () {
    testWidgets('displays first slide with navigation', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HeroCarousel(enableAutoRotate: false)));
      await tester.pump();
      expect(find.text('Browse Our Products'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward_ios), findsOneWidget);
      expect(find.byType(AnimatedContainer), findsNWidgets(3));
    });

    testWidgets('navigates through all slides', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HeroCarousel(enableAutoRotate: false)));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.arrow_forward_ios));
      await tester.pumpAndSettle();
      expect(find.text('Explore Collections'), findsOneWidget);
      await tester.tap(find.byIcon(Icons.arrow_forward_ios));
      await tester.pumpAndSettle();
      expect(find.text('Student Essentials'), findsOneWidget);
    });

    testWidgets('button navigates to route', (tester) async {
      await tester.pumpWidget(MaterialApp(home: const HeroCarousel(enableAutoRotate: false), routes: {'/all-products': (context) => const Scaffold(body: Text('All Products'))}));
      await tester.pump();
      await tester.tap(find.text('BROWSE ALL PRODUCTS'));
      await tester.pumpAndSettle();
      expect(find.text('All Products'), findsOneWidget);
    });

    test('HeroSlide model properties', () {
      const slide = HeroSlide(title: 'Test', description: 'Desc', buttonText: 'Btn', imageUrl: 'img.jpg', route: '/test');
      expect(slide.title, 'Test');
      expect(slide.route, '/test');
    });
  });
}
