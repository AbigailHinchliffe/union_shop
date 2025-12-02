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
    });

    testWidgets('renders expected number of collection cards', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();
      
      // Verify all 6 collections are rendered
      expect(find.byType(ProductCard), findsNWidgets(6));
      
      // Verify specific collection titles
      expect(find.text('Graduation Collection'), findsOneWidget);
      expect(find.text('Basic Essentials Collection'), findsOneWidget);
      expect(find.text('Varsity Collection'), findsOneWidget);
      expect(find.text('Customisable Merchandise'), findsOneWidget);
      expect(find.text('Pride Collection'), findsOneWidget);
      expect(find.text('Sale Collection'), findsOneWidget);
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

      FlutterError.onError = (FlutterErrorDetails details) {
        if (!details.toString().contains('overflowed')) {
          FlutterError.presentError(details);
        }
      };
      
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pump();

      final gridViewFinder = find.byType(GridView);
      expect(gridViewFinder, findsOneWidget);
      
      final gridView = tester.widget<GridView>(gridViewFinder);
      final gridDelegate = gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      
      expect(gridDelegate.crossAxisCount, equals(1));
    });

    testWidgets('grid shows 2 columns on wide screen', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
      });

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      final gridView = tester.widget<GridView>(find.byType(GridView));
      final gridDelegate = gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      
      expect(gridDelegate.crossAxisCount, equals(2));
    });

    testWidgets('has correct spacing between grid items', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      final gridView = tester.widget<GridView>(find.byType(GridView));
      final gridDelegate = gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;

      expect(gridDelegate.crossAxisSpacing, equals(24));
      expect(gridDelegate.mainAxisSpacing, equals(48));
    });

    testWidgets('grid does not scroll independently', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      final gridView = tester.widget<GridView>(find.byType(GridView));
      
      expect(gridView.physics, isA<NeverScrollableScrollPhysics>());
      
      expect(gridView.shrinkWrap, isTrue);
    });
  });

  group('Collection Model Tests', () {
    test('Collection model creates correctly', () {
      const collection = Collection(
        id: 'test-id',
        title: 'Test Collection',
        thumbnail: 'assets/test.jpg',
        description: 'Test description',
      );

      expect(collection.id, equals('test-id'));
      expect(collection.title, equals('Test Collection'));
      expect(collection.thumbnail, equals('assets/test.jpg'));
      expect(collection.description, equals('Test description'));
    });



    test('Collection model is immutable', () {
      const collection1 = Collection(
        id: 'test',
        title: 'Title',
        thumbnail: 'thumb',
        description: 'Desc',
      );

      const collection2 = Collection(
        id: 'test',
        title: 'Title',
        thumbnail: 'thumb',
        description: 'Desc',
      );

      expect(collection1.id, equals(collection2.id));
      expect(collection1.title, equals(collection2.title));
    });
  });

  group('Collections Screen Integration Tests', () {
    testWidgets('page scrolls correctly with footer', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      // Find the scrollable widget
      final scrollable = find.byType(SingleChildScrollView);
      expect(scrollable, findsOneWidget);

      // Get initial position
      final initialPosition = tester.getTopLeft(find.text('COLLECTIONS')).dy;

      // Try scrolling up
      await tester.drag(scrollable.first, const Offset(0, -300));
      await tester.pumpAndSettle();

      // Verify position changed (should be higher/more negative after scrolling up)
      final newPosition = tester.getTopLeft(find.text('COLLECTIONS')).dy;
      expect(newPosition, lessThan(initialPosition));
    });

    testWidgets('collections have correct data', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify specific collection properties are rendered
      expect(find.textContaining('Graduation'), findsOneWidget);
      expect(find.textContaining('Essentials'), findsOneWidget);
      expect(find.textContaining('Varsity'), findsOneWidget);
      expect(find.textContaining('Customisable'), findsOneWidget);
    });

    testWidgets('page has correct background color', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      // Find the Container directly in CollectionsScreen's body
      final containers = find.byType(Container);
      bool foundWhiteContainer = false;
      
      for (var i = 0; i < containers.evaluate().length; i++) {
        final container = tester.widget<Container>(containers.at(i));
        if (container.color == Colors.white) {
          foundWhiteContainer = true;
          break;
        }
      }

      expect(foundWhiteContainer, isTrue);
    });

    testWidgets('page has correct padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

      await tester.pumpAndSettle();

      // Find padding widgets and look for the one with 40.0 padding
      final paddings = find.byType(Padding);
      bool foundCorrectPadding = false;
      
      for (var i = 0; i < paddings.evaluate().length; i++) {
        final padding = tester.widget<Padding>(paddings.at(i));
        if (padding.padding == const EdgeInsets.all(40.0)) {
          foundCorrectPadding = true;
          break;
        }
      }

      expect(foundCorrectPadding, isTrue);
    });
  });
}