import 'package:flutter/material.dart'; 

class DropDown extends StatelessWidget {
  const DropDown ({super.key});

  @override
  Widget build (BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.menu,
        size: 18,
        color: Colors.grey,
      ),
      padding: const EdgeInsets.all(8),
      offset: const Offset(0,18*2),
        constraints: BoxConstraints(
        minWidth: screenWidth - 16,
      ),
      itemBuilder: (context) => const[
        PopupMenuItem(value: 'home', child: Text('Home')),
        PopupMenuItem(value: 'about',child: Text('About Us'))
      ]
    );
  }
}