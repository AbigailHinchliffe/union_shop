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

  });
}

