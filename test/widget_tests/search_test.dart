import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/search_box.dart';

void main() {
  Widget buildTestWidget() {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => showSearchBox(context),
            child: const Text('Search'),
          ),
        ),
      ),
    );
  }

  group('Search Box', () {
    testWidgets('Opens, accepts input, and submits search', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      expect(find.byType(AlertDialog), findsNothing);

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      expect(find.text('Search...'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.autofocus, true);
      expect(textField.decoration?.hintText, 'Search site...');

      await tester.enterText(find.byType(TextField), 'test product');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
      expect(find.text('Searching for: test product'), findsOneWidget);
    });

    testWidgets('Closes without searching and reopens cleanly', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'incomplete');
      await tester.tap(find.text('Close'));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
      expect(find.byType(SnackBar), findsNothing);

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsOneWidget);
      
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.controller?.text ?? '', '');
    });
  });
}
