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
              TextButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Collections'),
              ),
              Text(
                collectionTitle.toUpperCase(),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 16),
              if (collectionId == 'Graduation')
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildProductCard('Graduation Cap', 'assets/images/gradcap.jpg'),
                    _buildProductCard('Graduation Robe', 'assets/images/gradrobe.webp'),
                    _buildProductCard('Diploma Frame', 'assets/images/photoframe.jpg'),
                  ],
                ),
              if (collectionId == 'Essentials')
                GridView.count(
                  shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _buildProductCard('Purple T-Shirt', 'assets/images/purpletshirt.jpg'),
                      _buildProductCard('White Beanie', 'assets/images/whitebeanie.jpg'),
                      _buildProductCard('Basic White T-Shirt', 'assets/images/basictee.jpg'),
                      _buildProductCard('Black Joggers', 'assets/images/blackjoggers.jpg'),
                      _buildProductCard('Black Gloves', 'assets/images/blackgloves.jpg'),
                      _buildProductCard('Black Hoodie', 'assets/images/blackhoodie.jpg'),
                      _buildProductCard('Varsity Jersey', 'assets/images/portsunijersey.jpg'),
                      _buildProductCard('Purple Hoodie', 'assets/images/purplehoodie.webp'),
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