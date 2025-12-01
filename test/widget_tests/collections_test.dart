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
      
      addTearDown(() async {
        tester.view.resetPhysicalSize();

      
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
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsScreen(),
        ),
      );

  
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpAndSettle();

      final gridView = tester.widget<GridView>(find.byType(GridView));
      final gridDelegate = gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      
    
      expect(gridDelegate.crossAxisCount, equals(2));

      addTearDown(() => tester.view.resetPhysicalSize());
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

    });
  });
}

