import 'package:flutter/material.dart';
import 'package:union_shop/widgets/appshell.dart';

class CollectionDetailScreen extends StatefulWidget {
  final String collectionId;
  final String collectionTitle;

  const CollectionDetailScreen({
    super.key,
    required this.collectionId,
    required this.collectionTitle,
  });

  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen> {
  int _currentPage = 1;
  final int _itemsPerPage = 6;

  List<Map<String, String>> _getAllProducts() {
    return widget.collectionId == 'Graduation'
        ? [
            {'title': 'Graduation Cap', 'image': 'assets/images/gradcap.jpg'},
            {'title': 'Graduation Robe', 'image': 'assets/images/gradrobe.webp'},
            {'title': 'Diploma Frame', 'image': 'assets/images/photoframe.jpg'},
          ]
        : widget.collectionId == 'Essentials'
            ? [
                {'title': 'Purple T-Shirt', 'image': 'assets/images/purpletshirt.jpg'},
                {'title': 'White Beanie', 'image': 'assets/images/whitebeanie.jpg'},
                {'title': 'Basic White T-Shirt', 'image': 'assets/images/basictee.jpg'},
                {'title': 'Black Joggers', 'image': 'assets/images/blackjoggers.jpg'},
                {'title': 'Black Gloves', 'image': 'assets/images/blackgloves.jpg'},
                {'title': 'Black Hoodie', 'image': 'assets/images/blackhoodie.jpg'},
                {'title': 'Varsity Jersey', 'image': 'assets/images/portsunijersey.jpg'},
                {'title': 'Purple Hoodie', 'image': 'assets/images/purplehoodie.webp'},
              ]
            : [];
  }

  @override
  Widget build(BuildContext context) {
    final allProducts = _getAllProducts();
    final totalPages = (allProducts.length / _itemsPerPage).ceil();
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final pageProducts = allProducts.sublist(startIndex, (startIndex + _itemsPerPage).clamp(0, allProducts.length));

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.collectionTitle.toUpperCase(), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  if (totalPages > 1) Row(children: [const Text('Page: '), DropdownButton<int>(value: _currentPage, items: List.generate(totalPages, (i) => DropdownMenuItem(value: i + 1, child: Text('${i + 1}'))), onChanged: (v) => setState(() => _currentPage = v!)), Text(' of $totalPages')]),
                ],
              ),
              const SizedBox(height: 20),
              TextField(decoration: InputDecoration(hintText: 'Search products...', prefixIcon: const Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)))),
              const SizedBox(height: 16),
              GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, children: pageProducts.map((p) => _buildProductCard(p['title']!, p['image']!)).toList()),
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
        Expanded(child: Image.asset(imagePath, fit: BoxFit.cover)),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        const Text('£15.00'),
      ],
    );
  }
}