import 'package:flutter/material.dart';
import 'package:union_shop/widgets/appshell.dart';
import 'package:union_shop/main.dart';

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
                'PRODUCTS SECTION',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
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
                children: const [
                  ProductCard(
                    title: 'Portsmouth University Jersey',
                    price: '£25.00',
                    imageUrl: 'assets/images/portsunijersey.jpg',
                  ),
                  ProductCard(
                    title: 'Purple tee',
                    price: '£12.00',
                    imageUrl: 'assets/images/purpletshirt.jpg',
                  ),
                  ProductCard(
                    title: 'Black Joggers',
                    price: '£18.00',
                    imageUrl: 'assets/images/blackjoggers.jpg',
                  ),
                  ProductCard(
                    title: 'White beanie',
                    price: '£8.00',
                    imageUrl: 'assets/images/whitebeanie.jpg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}