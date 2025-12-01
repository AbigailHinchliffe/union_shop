import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/screens/collections_screen.dart';
import 'package:union_shop/widgets/appshell.dart';
import 'package:union_shop/main.dart';

void main() {
  group('CollectionsScreen Widget Tests', () {
    testWidgets('renders collections screen with title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      expect(find.text('COLLECTIONS'), findsOneWidget);
    });
    testWidgets('renders all collection cards', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Graduation Collection'), findsOneWidget);
      expect(find.text('Basic Essentials Collection'), findsOneWidget);
      expect(find.text('Varsity Collection'), findsOneWidget);
      expect(find.text('Customisable Merchandise'), findsOneWidget);
    });

    testWidgets('renders grid with correct layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(ProductCard), findsNWidgets(4));
    });

    testWidgets('uses Appshell wrapper', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(Appshell), findsOneWidget);
    });

    testWidgets('grid adjusts to screen width', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      
      addTearDown(() {
        tester.view.resetPhysicalSize();
      });
    });
  });
}


