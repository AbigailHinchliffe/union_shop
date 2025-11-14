import 'package:flutter/material.dart'; 

class DropDown extends StatelessWidget {
  const DropDown ({super.key});

  @override
  Widget build (BuildContext context){
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.menu,
        size: 18,
        color: Colors.grey,
      ),
      padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(
        minWidth: 32,
        minHeight: 32,
      ),
      itemBuilder: (context) => const[
        PopupMenuItem(value: 'home', child: Text('Home')),
        PopupMenuItem(value: 'about',child: Text('About Us'))
      ]
    );
  }
}