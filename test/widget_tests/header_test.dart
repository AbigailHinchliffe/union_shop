import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/about_us.dart';
import 'package:union_shop/screens/login_screen.dart';
import 'package:union_shop/screens/collections_screen.dart';
import 'package:union_shop/screens/collection_detail.dart';

void main() {
  group('AppHeader Tests', () {
    testWidgets('displays all elements', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      await tester.pump();
      expect(find.textContaining('BIG SALE'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
    });

    testWidgets('desktop shows nav links and About navigates', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      await tester.pump();
      expect(find.text('Shop'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      await tester.tap(find.text('About'));
      await tester.pumpAndSettle();
      expect(find.byType(AboutUs), findsOneWidget);
    });

    testWidgets('shop menu navigates to Collections and Sale', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      await tester.pump();
      await tester.tap(find.text('Shop'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Collections').last);
      await tester.pumpAndSettle();
      expect(find.byType(CollectionsScreen), findsOneWidget);
    });

    testWidgets('shop menu navigates to Products', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      await tester.pump();
      await tester.tap(find.text('Shop'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Products'));
      await tester.pumpAndSettle();
      expect(tester.widget<CollectionDetailScreen>(find.byType(CollectionDetailScreen)).collectionId, 'All');
    });

    testWidgets('mobile shows dropdown', (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      await tester.pump();
      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.text('Shop'), findsNothing);
    });

    testWidgets('person icon navigates to login', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.person_outline), warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(find.byType(LoginScreen), findsOneWidget);
    });
  });
}
