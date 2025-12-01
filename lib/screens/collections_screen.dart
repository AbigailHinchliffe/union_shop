import 'package:flutter/material.dart';
import 'package:union_shop/widgets/appshell.dart';

class CollectionsScreen extends StatelessWidget{
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Appshell(
      body: Center(
        child: Text(
          'Collections Screen',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
  
}