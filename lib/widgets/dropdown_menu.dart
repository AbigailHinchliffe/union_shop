import 'package:flutter/material.dart'; 
import 'package:union_shop/about_us.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/screens/collections_screen.dart';
import 'package:union_shop/screens/collection_detail.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final GlobalKey _buttonKey = GlobalKey();
  OverlayEntry? _entry;
  bool _isOpen = false;
  bool _inShopSubmenu = false;

  void _open() {
    if (_isOpen) return; 
    final renderBox = _buttonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return; 
    final buttonSize = renderBox.size; 
    final buttonPos = renderBox.localToGlobal(Offset.zero); 
    final overlay = Overlay.of(context); 

    _entry = OverlayEntry(builder: (ctx) {
      final screenHeight = MediaQuery.of(ctx).size.height;
      final safeBottom = MediaQuery.of(ctx).padding.bottom;
      final availableHeight = (screenHeight - (buttonPos.dy + buttonSize.height) - safeBottom - 20)
          .clamp(120.0, screenHeight);

      return Positioned.fill(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _close,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: buttonPos.dy + buttonSize.height),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: availableHeight,
                  ),
                  child: Material(
                    color: Colors.white,
                    elevation: 8,
                    child: _inShopSubmenu ? _buildShopMenu(ctx) : _buildMainMenu(ctx),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });

    overlay.insert(_entry!);
    setState(() => _isOpen = true);
  }

  Widget _buildMainMenu(BuildContext ctx) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: const Text('Home', style: TextStyle(fontSize: 18)),
          onTap: () {
            _close();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        const Divider(height: 1),
        ListTile(
          title: const Text('Shop', style: TextStyle(fontSize: 18)),
          onTap: () {
            setState(() => _inShopSubmenu = true);
            _entry?.markNeedsBuild();
          },
        ),
        const Divider(height: 1),
        ListTile(
          title: const Text('About', style: TextStyle(fontSize: 18)),
          onTap: () {
            _close();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutUs()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildShopMenu(BuildContext ctx) {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                setState(() => _inShopSubmenu = false);
                _entry?.markNeedsBuild();
              },
            ),
            const SizedBox(width: 8),
            const Text('Shop', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ],
        ),
        const Divider(height: 1),
        ListTile(
          title: const Text('Collections', style: TextStyle(fontSize: 18)),
          onTap: () {
            _close();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CollectionsScreen()),
            );
          },
        ),
        const Divider(height: 1),
        ListTile(
          title: const Text('Products', style: TextStyle(fontSize: 18)),
          onTap: () {
            _close();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CollectionDetailScreen(
                  collectionId: 'All',
                  collectionTitle: 'All Products',
                ),
              ),
            );
          },
        ),
        const Divider(height: 1),
        ListTile(
          title: const Text('Sale', style: TextStyle(fontSize: 18)),
          onTap: () {
            final nav = Navigator.of(context);
            _close();
            Future.delayed(const Duration(milliseconds: 100), () {
              nav.push(
                MaterialPageRoute(
                  builder: (context) => const CollectionDetailScreen(
                    collectionId: 'Sale', 
                    collectionTitle: 'Sale Collection',
                  ),
                ),
              );
            });
          },
        ),
      ],
    );
  }

  void _close() {
    _entry?.remove(); 
    _entry = null;
    setState(() => _isOpen = false); 
  }

  //void _select(String value) {
  //  _close(); 
  //}

  @override
  void dispose() {
    _entry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: _buttonKey, 
      icon: Icon(_isOpen ? Icons.close : Icons.menu, size: 22, color: Colors.grey),
      padding: const EdgeInsets.all(8),
      onPressed: _isOpen ? _close : _open, 
    );
  }
}