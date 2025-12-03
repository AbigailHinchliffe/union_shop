import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/dropdown_menu.dart';

void main() {
  testWidgets('DropDown menu opens, navigates to Shop submenu, and closes', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
    await tester.pumpAndSettle();

    // Verify dropdown is present and closed
    expect(find.byType(DropDown), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);

    // Open dropdown
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.close), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Shop'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);

    // Navigate to Shop submenu
    await tester.tap(find.text('Shop'));
    await tester.pumpAndSettle();
    expect(find.text('Collections'), findsOneWidget);
    expect(find.text('Products'), findsOneWidget);
    expect(find.text('Sale'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);

    // Go back to main menu
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    expect(find.text('Home'), findsOneWidget);

    // Close dropdown
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.menu), findsOneWidget);
  });
}
