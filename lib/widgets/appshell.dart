import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';

class Appshell extends StatelessWidget {
  final Widget body;

  const Appshell({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  body,
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}