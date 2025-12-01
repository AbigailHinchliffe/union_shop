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
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 48),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                crossAxisSpacing: 24,
                mainAxisSpacing: 48,
                children: _buildCollectionCards(context),
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
        thumbnail: 'assets/images/gradcap.jpg',
        description: 'Graduation Collection Essentials.',
      ),
      const Collection(
        id: 'Essentials',
        title: 'Basic Essentials Collection',
        thumbnail: 'assets/images/purpletshirt.jpg',
        description: 'Basic attire for Campus Life.',
      ),
      const Collection(
        id: 'Sports',
        title: 'Varsity Collection',
        thumbnail: 'assets/images/portsunijersey.jpg',
        description: 'Collection for everyday Varsity gear to represent the Uni.',
      ),
      const Collection(
        id: 'Custom',
        title: 'Customisable Merchandise',
        thumbnail: 'assets/images/customhoodie.jpg',
        description: 'Customisable Merchandise for everyday essentials.',
      ),
    ];

    return collections.map((c) {
      return ProductCard(
        title: c.title,
        price: '',
        imageUrl: c.thumbnail,
      );
    }).toList();
  }
}