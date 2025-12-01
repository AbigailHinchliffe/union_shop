import 'package:flutter/material.dart';
import 'package:union_shop/widgets/appshell.dart';
import 'package:union_shop/main.dart';

class Collection {
  final String id;
  final String title;
  final String thumbnail;
  final String description;

  const Collection({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.description,
  });
}

class CollectionsScreen extends StatelessWidget{
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Appshell(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              const Text(
                'COLLECTIONS',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 48),
              Expanded(
                child: GridView.count(
                  crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 48,
                  children: _buildCollectionCards(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCollectionCards(BuildContext context) {
    final collections = <Collection>[
      const Collection(
        id: 'Graduation',
        title: 'Graduation Collection',
        thumbnail: 'placeholder',
        description: 'Graduation Collection Essentials.',
      ),
      const Collection(
        id: 'Essentials',
        title: 'Basic Essentials Collection',
        thumbnail: 'placeholder',
        description: 'Basic attire for Campus Life.',
      ),
      const Collection(
        id: 'Sports',
        title: 'Varsity Collection',
        thumbnail: '',
        description: 'Collection for everyday Varsity gear to represent the Uni.',
      ),
      const Collection(
        id: 'Custom',
        title: 'Customisable Merchandise',
        thumbnail: '',
        description: 'Customisable Merchandise for everyday essentials.',
      ),
    ];

    return collections.map((c) {
      return ProductCard(
        title: c.title,
        price: '', // no price on collection overview; keep empty or add a field later
        imageUrl: c.thumbnail,
      );
    }).toList();
  }
}