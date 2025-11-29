import 'package:flutter/material.dart';
import 'package:union_shop/widgets/appshell.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Appshell(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'We are the University of Portsmouth Students Union, est. since 1911, we represent over 23,000 students at the University of Portsmouth. Our mission is to...',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
