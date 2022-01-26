import 'package:flutter/material.dart';

class AnimatedCarousel1 extends StatefulWidget {
  const AnimatedCarousel1({Key? key}) : super(key: key);

  @override
  _AnimatedCarousel1State createState() => _AnimatedCarousel1State();
}

class _AnimatedCarousel1State extends State<AnimatedCarousel1>
    with TickerProviderStateMixin {
  late final PageController _pageController;
  int page = 0;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9, initialPage: 0);
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Carousel 1'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) => setState(() {
                page = value;
              }),
              children: [
                _buildCard(),
                _buildCard(),
                _buildCard(),
                _buildCard(),
                _buildCard(),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDot(page == 0 ? true : false),
              _buildDot(page == 1 ? true : false),
              _buildDot(page == 2 ? true : false),
              _buildDot(page == 3 ? true : false),
              _buildDot(page == 4 ? true : false),
            ],
          ),
          const Spacer()
        ],
      ),
    );
  }

  Widget _buildDot(bool val) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Container(
        margin: const EdgeInsets.only(right: 10),
        width: val ? 20 : 10,
        height: 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: val ? Colors.black : Colors.grey),
      ),
    );
  }

  Widget _buildCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        child: Image.asset(
          'assets/flower.jpg',
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
