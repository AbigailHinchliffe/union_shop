import 'package:flutter/material.dart';
import 'package:union_shop/widgets/appshell.dart';
import 'package:union_shop/screens/collection_detail_screen.dart';

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

class CollectionsScreen extends StatelessWidget {
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
                mainAxisSpacing: 24,
                childAspectRatio: 1.2,
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
      const Collection(
        id: 'Pride',
        title: 'Pride Collection',
        thumbnail: 'assets/images/rainbowtote.jpg',
        description: 'Celebrate diversity with our Pride Collection.',
      ),
      const Collection(
        id: 'Sale',
        title: 'Sale Collection',
        thumbnail: 'assets/images/styluspen.jpg',
        description: 'Our Sale Stock.',
      ),
    ];

    return collections.map((c) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Placeholder(),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: c.thumbnail.isEmpty
                      ? Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.image_not_supported, color: Colors.grey, size: 50),
                          ),
                        )
                      : Image.asset(
                          c.thumbnail,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(Icons.image_not_supported, color: Colors.grey, size: 50),
                              ),
                            );
                          },
                        ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    c.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}