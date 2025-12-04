import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/screens/login_screen.dart';

void main() {
  group('AppHeader Tests', () {
    testWidgets('displays banner and icons', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      await tester.pump();
      expect(find.textContaining('BIG SALE'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
    });

    testWidgets('desktop shows navigation links', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      await tester.pump();
      expect(find.text('Home'), findsWidgets);
      expect(find.text('Shop'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
    });
  });
}