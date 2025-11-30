import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:union_shop/main.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/header.dart';

void main() {
  group('Home Page Tests', () {

//Remindere comment for Basic UI tests & product card tests

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

      final upsufinder = find.byWidgetPredicate(
        (widget) => widget is Text && (widget.data ?? '').toLowerCase().contains('@upsu'),
        description: 'Text widget containing "@upsu"',
      );
      expect(upsufinder, findsOneWidget);
    });
  });

  testWidgets('Footer shows office hours and @upsu text', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Footer())));
    await tester.pumpAndSettle();

    final officeFinder = find.byWidgetPredicate(
      (w) => w is Text && (w.data ?? '').toLowerCase().contains('office hours'),
      description: 'Text containing "Office hours"',
    );
    final upsufinder = find.byWidgetPredicate(
      (w) => w is Text && (w.data ?? '').toLowerCase().contains('@upsu'),
      description: 'Text containing "@upsu"',
    );

    expect(officeFinder, findsOneWidget);
    expect(upsufinder, findsOneWidget);
  });
}
