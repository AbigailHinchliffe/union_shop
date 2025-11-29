import 'package:flutter/material.dart'; 
import 'package:union_shop/about_us.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final GlobalKey _buttonKey = GlobalKey();
  OverlayEntry? _entry;
  bool _isOpen = false;

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
                    child: ListView(
                      shrinkWrap: true, 
                      children: [
                        ListTile(
                          title: const Text('Home', style: TextStyle(fontSize: 18)),
                          onTap: () => _select('home'),
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
                    ),
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

  void _close() {
    _entry?.remove(); 
    _entry = null;
    setState(() => _isOpen = false); 
  }

  void _select(String value) {
    _close(); 
  }

  @override
  void dispose() {
    _entry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: _buttonKey, 
      icon: Icon(_isOpen ? Icons.close : Icons.menu, size: 22, color: Colors.grey[800]),
      padding: const EdgeInsets.all(8),
      onPressed: _isOpen ? _close : _open, 
    );
  }
}