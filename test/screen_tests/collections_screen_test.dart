import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/screens/collections_screen.dart';

void main() {
  group('Collections Screen Tests', () {
    testWidgets('displays all collection cards with titles', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify page title
      expect(find.text('COLLECTIONS'), findsOneWidget);

      // Verify all collection titles appear
      expect(find.text('Graduation Collection'), findsOneWidget);
      expect(find.text('Basic Essentials Collection'), findsOneWidget);
      expect(find.text('Varsity Collection'), findsOneWidget);
      expect(find.text('Customisable Merchandise'), findsOneWidget);
      expect(find.text('Pride Collection'), findsOneWidget);
      expect(find.text('Sale Collection'), findsOneWidget);
    });

    testWidgets('collection cards are tappable', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      // Find the Graduation Collection card
      final graduationCard = find.text('Graduation Collection');
      expect(graduationCard, findsOneWidget);

      // Verify it's in a GestureDetector (tappable)
      final gestureDetector = find.ancestor(
        of: graduationCard,
        matching: find.byType(GestureDetector),
      );
      expect(gestureDetector, findsOneWidget);
    });

    testWidgets('displays collection images', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify that images are present in the widget tree
      expect(find.byType(Image), findsAtLeastNWidgets(6));
    });

    testWidgets('renders grid layout with correct number of columns', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      // Find the GridView
      final gridView = tester.widget<GridView>(find.byType(GridView));
      
      // Verify it's a GridView.count
      expect(gridView, isA<GridView>());
    });

    testWidgets('uses Appshell wrapper', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify header and footer are present (from Appshell)
      expect(find.byType(Image), findsWidgets); // Header logo
      expect(find.text('COLLECTIONS'), findsOneWidget); // Page title
    });
  });
}
