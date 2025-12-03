import 'package:flutter/material.dart';
import 'package:union_shop/widgets/search_box.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Office hours:\n\n Monday - Friday 10am - 4pm\nOnline 24/7\n\n@upsu store 2025/26',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => showSearchBox(context),
                child: const Text('Search'),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Terms & Conditions of Sale placeholder')),
                  );
                },
                child: const Text('Terms & Conditions of Sale'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}