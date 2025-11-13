import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About The Union')
      ),
      body: const Center(
        child: Text('We are the University of Portsmouth Students Union, est. since 1911, we represent over 23,000 students at the University of Portsmouth. Our mission is to...')
      )
    );
  }
}
