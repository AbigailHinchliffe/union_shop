import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/screens/login_screen.dart';

void main() {
  testWidgets('Login screen renders form and toggles', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    
    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('LOGIN'), findsOneWidget);
    
    await tester.tap(find.text('Need an account? Sign up'));
    await tester.pump();
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.text('SIGN UP'), findsOneWidget);
  });
}
