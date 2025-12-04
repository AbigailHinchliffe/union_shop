import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/footer.dart';

void main() {
  group('Footer Tests', () {
    testWidgets('displays content and buttons', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Footer())));
      expect(find.textContaining('@upsu'), findsOneWidget);
      expect(find.textContaining('Monday - Friday'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Terms & Conditions of Sale'), findsOneWidget);
    });

    testWidgets('Terms button shows snackbar', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Footer())));
      await tester.tap(find.text('Terms & Conditions of Sale'));
      await tester.pump();
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Terms & Conditions of Sale placeholder'), findsOneWidget);
    });
  });
}
