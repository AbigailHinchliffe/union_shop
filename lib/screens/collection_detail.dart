import 'package:flutter/material.dart';
import 'package:union_shop/widgets/appshell.dart';

class CollectionDetailScreen extends StatelessWidget {
  final String collectionId;
  final String collectionTitle;

  const CollectionDetailScreen({
    super.key,
    required this.collectionId,
    required this.collectionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Appshell(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                collectionTitle.toUpperCase(),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              if (collectionId == 'Graduation')
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildProductCard('Product 1', 'assets/images/gradcap.jpg'),
                    _buildProductCard('Product 2', 'assets/images/purpletshirt.jpg'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(String title, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        const Text('£15.00'),
      ],
    );
  }
}