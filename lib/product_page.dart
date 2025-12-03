import 'package:flutter/material.dart';
import 'package:union_shop/widgets/appshell.dart';

class ProductCatalog {
  static final Map<String, Map<String, String>> products = {
    'grad_cap': {
      'id': 'grad_cap',
      'title': 'Graduation Cap',
      'price': '£15.00',
      'image': 'assets/images/gradcap.jpg',
      'imageUrl': 'assets/images/gradcap.jpg',
      'description': 'Traditional graduation cap for your special day',
      'collection': 'Graduation',
    },
  };

  static Map<String, String>? getProductById(String id) {
    return products[id];
  }

  static List<Map<String, String>> getProductsByCollection(String collectionId) {
    return products.values
        .where((product) => product['collection'] == collectionId)
        .toList();
  }

  static List<Map<String, String>> getAllProducts() {
    return products.values.toList();
  }

  static List<Map<String, String>> getFeaturedProducts() {
    return [
      products['purple_tshirt']!,
      products['black_hoodie']!,
      products['white_beanie']!,
      products['grad_cap']!,
    ];
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final String? productId = ModalRoute.of(context)?.settings.arguments as String?;
    
    final product = productId != null ? ProductCatalog.getProductById(productId) : null;
    
    // Fallback values if product not found
    final String title = product?['title'] ?? 'Product Not Found';
    final String price = product?['price'] ?? '£0.00';
    final String imageUrl = product?['imageUrl'] ?? 'assets/images/placeholder.png';
    final String description = product?['description'] ?? 'Product description not available';

    return Appshell(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
            ),
            const SizedBox(height: 16),

            // Product image
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image_not_supported, size: 64, color: Colors.grey),
                            SizedBox(height: 8),
                            Text('Image unavailable', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Product name
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 12),

            // Product price
            Text(
              price,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4d2963),
              ),
            ),

            const SizedBox(height: 24),

            // Product description
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
