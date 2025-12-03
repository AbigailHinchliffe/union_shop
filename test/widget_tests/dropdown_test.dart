import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/dropdown_menu.dart';
import 'package:union_shop/about_us.dart';
import 'package:union_shop/screens/collections_screen.dart';
import 'package:union_shop/screens/collection_detail.dart';

void main() {
  Future<void> openMenu(WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
  }

  Future<void> navigateToShopSubmenu(WidgetTester tester) async {
    await openMenu(tester);
    await tester.tap(find.text('Shop'));
    await tester.pumpAndSettle();
  }

  group('DropDown Basic Functionality', () {
    testWidgets('Opens, closes, and handles outside taps', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DropDown())));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.byIcon(Icons.close), findsNothing);

      await openMenu(tester);
      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close), warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.text('Home'), findsNothing);

      await openMenu(tester);
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.text('Home'), findsNothing);
    });

    testWidgets('Navigates to About screen', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DropDown())));
      await tester.pumpAndSettle();

      await openMenu(tester);
      await tester.tap(find.text('About'));
      await tester.pumpAndSettle();
      expect(find.byType(AboutUs), findsOneWidget);
    });
  });

  group('DropDown Shop Submenu', () {
    testWidgets('Opens Shop submenu and navigates back', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DropDown())));
      await tester.pumpAndSettle();

      await navigateToShopSubmenu(tester);
      expect(find.text('Collections'), findsOneWidget);
      expect(find.text('Products'), findsOneWidget);
      expect(find.text('Sale'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.text('Home'), findsNothing);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Collections'), findsNothing);
    });

    testWidgets('Navigates to Collections screen', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DropDown())));
      await tester.pumpAndSettle();

      await navigateToShopSubmenu(tester);
      await tester.tap(find.text('Collections'));
      await tester.pumpAndSettle();
      expect(find.byType(CollectionsScreen), findsOneWidget);
    });

    testWidgets('Navigates to All Products screen', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DropDown())));
      await tester.pumpAndSettle();

      await navigateToShopSubmenu(tester);
      await tester.tap(find.text('Products'));
      await tester.pumpAndSettle();
      final widget = tester.widget<CollectionDetailScreen>(find.byType(CollectionDetailScreen));
      expect(widget.collectionId, 'All');
      expect(widget.collectionTitle, 'All Products');
    });

    testWidgets('Navigates to Sale screen', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DropDown())));
      await tester.pumpAndSettle();

      await navigateToShopSubmenu(tester);
      await tester.tap(find.text('Sale'));
      await tester.pump(const Duration(milliseconds: 150));
      await tester.pumpAndSettle();
      final widget = tester.widget<CollectionDetailScreen>(find.byType(CollectionDetailScreen));
      expect(widget.collectionId, 'Sale');
      expect(widget.collectionTitle, 'Sale Collection');
    });

    testWidgets('Closes Shop submenu on outside tap', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DropDown())));
      await tester.pumpAndSettle();

      await navigateToShopSubmenu(tester);
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.text('Collections'), findsNothing);
    });
  });

  group('DropDown State & Layout', () {
    testWidgets('Handles multiple open/close cycles', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DropDown())));
      await tester.pumpAndSettle();

      for (int i = 0; i < 3; i++) {
        await openMenu(tester);
        expect(find.text('Home'), findsOneWidget);
        await tester.tap(find.byIcon(Icons.close), warnIfMissed: false);
        await tester.pumpAndSettle();
        expect(find.text('Home'), findsNothing);
      }
    });



    testWidgets('Displays correct layout and styling', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DropDown())));
      await tester.pumpAndSettle();

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.padding, const EdgeInsets.all(8));
      final icon = iconButton.icon as Icon;
      expect(icon.size, 22);
      expect(icon.color, Colors.grey);

      await openMenu(tester);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(3));
      expect(find.byType(Divider), findsNWidgets(2));

      await tester.tap(find.text('Shop'));
      await tester.pumpAndSettle();
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(3));
      expect(find.byType(Divider), findsNWidgets(3));
    });
  });
}

