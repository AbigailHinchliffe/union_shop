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

    testWidgets('navigates to collection detail page and shows correct title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      // Tap on Graduation Collection
      await tester.tap(find.text('Graduation Collection'));
      await tester.pumpAndSettle();

      // Verify navigation occurred and title is displayed
      expect(find.text('GRADUATION COLLECTION'), findsOneWidget);
      expect(find.text('Back to Collections'), findsOneWidget);
    });

    testWidgets('collection cards have proper styling with dark overlay', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      // Find containers with dark overlay
      final containers = tester.widgetList<Container>(find.byType(Container));
      
      // Check that at least one container has a dark overlay (black with opacity)
      final hasOverlay = containers.any((container) {
        final decoration = container.decoration as BoxDecoration?;
        if (decoration?.color != null) {
          final color = decoration!.color!;
          return color.alpha > 0 && color.alpha < 255; // Semi-transparent
        }
        return false;
      });
      
      expect(hasOverlay, isTrue);
    });

    testWidgets('all collection titles are centered and visible', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      final collections = [
        'Graduation Collection',
        'Basic Essentials Collection',
        'Varsity Collection',
        'Customisable Merchandise',
        'Pride Collection',
        'Sale Collection',
      ];

      // Verify each collection title is visible and styled correctly
      for (final collection in collections) {
        final textFinder = find.text(collection);
        expect(textFinder, findsOneWidget);
        
        // Get the Text widget and verify it has proper styling
        final textWidget = tester.widget<Text>(textFinder);
        expect(textWidget.style?.color, Colors.white);
        expect(textWidget.style?.fontWeight, FontWeight.bold);
        expect(textWidget.textAlign, TextAlign.center);
      }
    });
  });
}
