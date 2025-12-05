import 'package:flutter/material.dart';
import 'package:union_shop/widgets/appshell.dart';
import 'package:union_shop/product_page.dart';

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
  String _sortBy = 'none';
  String _priceFilter = 'all';

  double _parsePrice(String priceString) {
    return double.tryParse(priceString.replaceAll('£', '').replaceAll(',', '')) ?? 0.0;
  }

  List<Map<String, String>> _getAllProducts() {
    List<Map<String, String>> products;
    if (widget.collectionId == 'All') {
      products = ProductCatalog.getAllProducts();
    } else {
      products = ProductCatalog.getProductsByCollection(widget.collectionId);
    }
    
    if (_priceFilter != 'all') {
      products = products.where((product) {
        final price = _parsePrice(product['price']!);
        switch (_priceFilter) {
          case 'under10':
            return price < 10;
          case '10-25':
            return price >= 10 && price <= 25;
          case '25-50':
            return price > 25 && price <= 50;
          case 'over50':
            return price > 50;
          default:
            return true;
        }
      }).toList();
    }
    
    // Apply sorting
    if (_sortBy == 'a-z') {
      products.sort((a, b) => a['title']!.compareTo(b['title']!));
    } else if (_sortBy == 'z-a') {
      products.sort((a, b) => b['title']!.compareTo(a['title']!));
    } else if (_sortBy == 'price-low') {
      products.sort((a, b) => _parsePrice(a['price']!).compareTo(_parsePrice(b['price']!)));
    } else if (_sortBy == 'price-high') {
      products.sort((a, b) => _parsePrice(b['price']!).compareTo(_parsePrice(a['price']!)));
    }
    
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final allProducts = _getAllProducts();
    final totalPages = (allProducts.length / _itemsPerPage).ceil();
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final pageProducts = allProducts.sublist(
      startIndex,
      (startIndex + _itemsPerPage).clamp(0, allProducts.length),
    );

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
                  Flexible(
                    child: Text(
                      widget.collectionTitle.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    children: [
                      DropdownButton<String>(
                        value: _priceFilter,
                        items: const [
                          DropdownMenuItem(value: 'all', child: Text('Price: All')),
                          DropdownMenuItem(value: 'under10', child: Text('Under £10')),
                          DropdownMenuItem(value: '10-25', child: Text('£10 - £25')),
                          DropdownMenuItem(value: '25-50', child: Text('£25 - £50')),
                          DropdownMenuItem(value: 'over50', child: Text('Over £50')),
                        ],
                        onChanged: (v) => setState(() {
                          _priceFilter = v!;
                          _currentPage = 1;
                        }),
                      ),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: _sortBy,
                        items: const [
                          DropdownMenuItem(value: 'none', child: Text('Sort')),
                          DropdownMenuItem(value: 'a-z', child: Text('A-Z')),
                          DropdownMenuItem(value: 'z-a', child: Text('Z-A')),
                          DropdownMenuItem(value: 'price-low', child: Text('Price: Low to High')),
                          DropdownMenuItem(value: 'price-high', child: Text('Price: High to Low')),
                        ],
                        onChanged: (v) => setState(() {
                          _sortBy = v!;
                          _currentPage = 1;
                        }),
                      ),
                      if (totalPages > 1) ...[
                        const SizedBox(width: 8),
                        const Text('Page: '),
                        DropdownButton<int>(
                          value: _currentPage,
                          items: List.generate(
                            totalPages,
                            (i) => DropdownMenuItem(
                              value: i + 1,
                              child: Text('${i + 1}'),
                            ),
                          ),
                          onChanged: (v) => setState(() => _currentPage = v!),
                        ),
                        Text(' of $totalPages'),
                      ],
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: pageProducts.map((p) => _buildProductCard(p)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    final originalPrice = product['originalPrice'];
    final salePercentage = product['salePercentage'];
    final price = product['price']!;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductPage(),
            settings: RouteSettings(arguments: product['id']),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              product['image']!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            product['title']!,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          if (originalPrice != null && salePercentage != null) ...[
            Row(
              children: [
                Text(
                  originalPrice,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.red,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '-$salePercentage%',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
          ],
          Text(
            price,
            style: TextStyle(
              color: originalPrice != null ? Colors.green[700] : Colors.black,
              fontWeight: originalPrice != null ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}