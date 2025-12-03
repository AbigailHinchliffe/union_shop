import 'package:flutter/material.dart';
import 'package:union_shop/about_us.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/screens/collections_screen.dart';
import 'package:union_shop/screens/collection_detail.dart';
import 'package:union_shop/product_page.dart';
import 'dropdown_menu.dart';

class AppHeader extends StatelessWidget{
  const AppHeader({super.key});
  
  @override
  Widget build (BuildContext context){
    
    void showSearchBox() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Search...'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search site...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onSubmitted: (value) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Searching for: $value')),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    }
    
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
      children: [
        // Top banner
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: const Color(0xFF4d2963),
          child: const Text(
            'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        // Main header
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  child: Image.network(
                    'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                    height: 18,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        width: 18,
                        height: 18,
                        child: const Center(
                          child: Icon(Icons.image_not_supported,
                              color: Colors.grey),
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                // Desktop: centered nav links
                if (!isMobile) ...[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    },
                    child: const Text('Home', style: TextStyle(fontSize: 16, color: Colors.black87)),
                  ),
                  const SizedBox(width: 16),
                  _buildShopMenu(context),
                  const SizedBox(width: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AboutUs()),
                      );
                    },
                    child: const Text('About', style: TextStyle(fontSize: 16, color: Colors.black87)),
                  ),
                ],
                const Spacer(),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          size: 18,
                          color: Colors.grey,
                        ),
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                        onPressed: showSearchBox,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.person_outline,
                          size: 18,
                          color: Colors.grey,
                        ),
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Account features not yet implemented')),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Shopping cart features not yet implemented')),
                          );
                        },
                      ),
                      if (isMobile) const DropDown(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
  }

  Widget _buildShopMenu(BuildContext context) {
    return PopupMenuButton<String>(
      child: const Row(
        children: [
          Text('Shop', style: TextStyle(fontSize: 16, color: Colors.black87)),
          SizedBox(width: 4),
          Icon(Icons.arrow_drop_down, size: 20, color: Colors.black87),
        ],
      ),
      onSelected: (value) {
        switch (value) {
          case 'collections':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CollectionsScreen()),
            );
            break;
          case 'products':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductPage()),
            );
            break;
          case 'sale':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CollectionDetailScreen(
                  collectionId: 'Sale',
                  collectionTitle: 'Sale Collection',
                ),
              ),
            );
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'collections', child: Text('Collections')),
        const PopupMenuItem(value: 'products', child: Text('Products')),
        const PopupMenuItem(value: 'sale', child: Text('Sale')),
      ],
    );
  }
}
