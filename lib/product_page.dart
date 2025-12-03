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
      'type': 'accessory',
    },
    'grad_robe': {
      'id': 'grad_robe',
      'title': 'Graduation Robe',
      'price': '£45.00',
      'image': 'assets/images/gradrobe.webp',
      'imageUrl': 'assets/images/gradrobe.webp',
      'description': 'Official graduation robe',
      'collection': 'Graduation',
      'type': 'clothing',
    },
    'diploma_frame': {
      'id': 'diploma_frame',
      'title': 'Diploma Frame',
      'price': '£25.00',
      'image': 'assets/images/photoframe.jpg',
      'imageUrl': 'assets/images/photoframe.jpg',
      'description': 'Premium frame for your diploma',
      'collection': 'Graduation',
      'type': 'accessory',
    },
    
    'purple_tshirt': {
      'id': 'purple_tshirt',
      'title': 'Purple T-Shirt',
      'price': '£15.00',
      'image': 'assets/images/purpletshirt.jpg',
      'imageUrl': 'assets/images/purpletshirt.jpg',
      'description': 'Comfortable purple t-shirt with university branding',
      'collection': 'Essentials',
      'type': 'clothing',
    },
    'white_beanie': {
      'id': 'white_beanie',
      'title': 'White Beanie',
      'price': '£9.60',
      'originalPrice': '£12.00',
      'salePercentage': '20',
      'image': 'assets/images/whitebeanie.jpg',
      'imageUrl': 'assets/images/whitebeanie.jpg',
      'description': 'Warm white beanie hat',
      'collection': 'Sale',
      'type': 'accessory',
    },
    'basic_tee': {
      'id': 'basic_tee',
      'title': 'Basic White T-Shirt',
      'price': '£15.00',
      'image': 'assets/images/basictee.jpg',
      'imageUrl': 'assets/images/basictee.jpg',
      'description': 'Essential white t-shirt',
      'collection': 'Essentials',
      'type': 'clothing',
    },
    'black_joggers': {
      'id': 'black_joggers',
      'title': 'Black Joggers',
      'price': '£28.00',
      'image': 'assets/images/blackjoggers.jpg',
      'imageUrl': 'assets/images/blackjoggers.jpg',
      'description': 'Comfortable black joggers',
      'collection': 'Essentials',
      'type': 'clothing',
    },
    'black_gloves': {
      'id': 'black_gloves',
      'title': 'Black Gloves',
      'price': '£7.50',
      'originalPrice': '£10.00',
      'salePercentage': '25',
      'image': 'assets/images/blackgloves.jpg',
      'imageUrl': 'assets/images/blackgloves.jpg',
      'description': 'Warm black gloves',
      'collection': 'Sale',
      'type': 'accessory',
    },
    'black_hoodie': {
      'id': 'black_hoodie',
      'title': 'Black Hoodie',
      'price': '£35.00',
      'image': 'assets/images/blackhoodie.jpg',
      'imageUrl': 'assets/images/blackhoodie.jpg',
      'description': 'Classic black hoodie',
      'collection': 'Essentials',
      'type': 'clothing',
    },
    'varsity_jersey': {
      'id': 'varsity_jersey',
      'title': 'Varsity Jersey',
      'price': '£40.00',
      'image': 'assets/images/portsunijersey.jpg',
      'imageUrl': 'assets/images/portsunijersey.jpg',
      'description': 'Official Portsmouth University varsity jersey',
      'collection': 'Sports',
      'type': 'clothing',
    },
    'purple_hoodie': {
      'id': 'purple_hoodie',
      'title': 'Purple Hoodie',
      'price': '£35.00',
      'image': 'assets/images/purplehoodie.webp',
      'imageUrl': 'assets/images/purplehoodie.webp',
      'description': 'Purple hoodie with university logo',
      'collection': 'Essentials',
      'type': 'clothing',
    },
    'stylus_pen': {
      'id': 'stylus_pen',
      'title': 'Stylus Pen',
      'price': '£5.60',
      'originalPrice': '£7.00',
      'salePercentage': '20',
      'image': 'assets/images/styluspen.jpg',
      'imageUrl': 'assets/images/styluspen.jpg',
      'description': 'Multi-functional stylus pen for touchscreens',
      'collection': 'Sale',
      'type': 'accessory',
    },
    'custom_hoodie': {
      'id': 'custom_hoodie',
      'title': 'Custom Hoodie',
      'price': '£40.00',
      'image': 'assets/images/customhoodie.jpg',
      'imageUrl': 'assets/images/customhoodie.jpg',
      'description': 'Hoodie you can customise with your own text or design',
      'collection': 'Custom',
      'type': 'clothing',
    },
    'rainbow_tote': {
      'id': 'rainbow_tote',
      'title': 'Rainbow Tote Bag',
      'price': '£12.00',
      'image': 'assets/images/rainbowtote.jpg',
      'imageUrl': 'assets/images/rainbowtote.jpg',
      'description': 'Celebrate diversity with this rainbow tote bag',
      'collection': 'Pride',
      'type': 'accessory',
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

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _selectedQuantity = 1;
  String _selectedSize = 'M';
  
  final List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'];

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final String? productId = ModalRoute.of(context)?.settings.arguments as String?;
    
    final product = productId != null ? ProductCatalog.getProductById(productId) : null;
    
    final String title = product?['title'] ?? 'Product Not Found';
    final String price = product?['price'] ?? '£0.00';
    final String imageUrl = product?['imageUrl'] ?? 'assets/images/placeholder.png';
    final String description = product?['description'] ?? 'Product description not available';
    final String productType = product?['type'] ?? 'accessory';
    final bool isClothing = productType == 'clothing';

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

            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              price,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4d2963),
              ),
            ),

            const SizedBox(height: 24),

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

            const SizedBox(height: 24),

            if (isClothing) ...[
              Row(
                children: [
                  const Text('Size:',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedSize,
                      underline: const SizedBox(),
                      items: _sizes
                          .map((size) => DropdownMenuItem<String>(
                                value: size,
                                child: Text(size),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedSize = value ?? 'M';
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],

            Row(
              children: [
                const Text(
                  'Quantity:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<int>(
                    value: _selectedQuantity,
                    underline: const SizedBox(),
                    items: List.generate(10, (index) => index + 1)
                        .map((quantity) => DropdownMenuItem<int>(
                              value: quantity,
                              child: Text(quantity.toString()),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedQuantity = value ?? 1;
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  final sizeInfo = isClothing ? ' (Size: $_selectedSize)' : '';
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added $_selectedQuantity x $title$sizeInfo to cart'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4d2963),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                label: const Text('ADD TO CART', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
