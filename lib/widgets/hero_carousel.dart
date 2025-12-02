import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HeroSlide {
  final String title, description, buttonText, imageUrl;
  final String? route;
  const HeroSlide({required this.title, required this.description, required this.buttonText, required this.imageUrl, this.route});
}

class HeroCarousel extends StatefulWidget {
  final bool enableAutoRotate;
  const HeroCarousel({super.key, this.enableAutoRotate = true});
  @override
  State<HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<HeroCarousel> {
  final _controller = PageController();
  int _page = 0;
  
  final _slides = const [
    HeroSlide(title: 'Browse Our Products', description: 'Discover our wide range of university merchandise', buttonText: 'BROWSE ALL PRODUCTS', imageUrl: 'assets/images/customhoodie.jpg', route: '/product'),
    HeroSlide(title: 'Explore Collections', description: 'Shop by category and find exactly what you need', buttonText: 'BROWSE COLLECTIONS', imageUrl: 'assets/images/gradcap.jpg', route: '/collections'),
    HeroSlide(title: 'Student Essentials', description: 'Everything you need for campus life', buttonText: 'SHOP NOW', imageUrl: 'assets/images/purpletshirt.jpg', route: null),
  ];

  @override
  void initState() {
    super.initState();
    // Only start auto-rotation if enabled and not in test environment
    if (widget.enableAutoRotate && !kIsWeb) {
      Future.delayed(const Duration(seconds: 10), _autoRotate);
    }
  }

  void _autoRotate() {
    if (!mounted || !widget.enableAutoRotate) return;
    _controller.animateToPage((_page + 1) % _slides.length, duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
    Future.delayed(const Duration(seconds: 10), _autoRotate);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (i) => setState(() => _page = i),
            itemCount: _slides.length,
            itemBuilder: (_, i) => Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(_slides[i].imageUrl), fit: BoxFit.cover)),
                    child: Container(color: Colors.black.withValues(alpha: 0.7)),
                  ),
                ),
                Positioned(
                  left: 24, right: 24, top: 80,
                  child: Column(
                    children: [
                      Text(_slides[i].title, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
                      const SizedBox(height: 16),
                      Text(_slides[i].description, style: const TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.center),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () => _slides[i].route != null ? Navigator.pushNamed(context, _slides[i].route!) : null,
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4d2963), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                        child: Text(_slides[i].buttonText, style: const TextStyle(fontSize: 14, letterSpacing: 1)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20, left: 0, right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_slides.length, (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8, width: _page == i ? 24 : 8,
                decoration: BoxDecoration(color: _page == i ? Colors.white : Colors.white.withValues(alpha: 0.5), borderRadius: BorderRadius.circular(4)),
              )),
            ),
          ),
          Positioned(left: 16, top: 0, bottom: 0, child: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 32), onPressed: () => _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut))),
          Positioned(right: 16, top: 0, bottom: 0, child: IconButton(icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 32), onPressed: () => _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut))),
        ],
      ),
    );
  }
}