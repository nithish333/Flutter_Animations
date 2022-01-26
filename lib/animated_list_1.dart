import 'package:flutter/material.dart';

class AnimatedList1 extends StatefulWidget {
  const AnimatedList1({Key? key}) : super(key: key);

  @override
  _AnimatedList1State createState() => _AnimatedList1State();
}

class _AnimatedList1State extends State<AnimatedList1>
    with SingleTickerProviderStateMixin {
  double currentPage = 0;
  late final AnimationController _animationController;
  List<String> images = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png',
    'assets/8.png',
    'assets/9.png',
    'assets/10.png',
    'assets/11.png',
    'assets/12.png',
  ];
  PageController _pageController =
      PageController(viewportFraction: 0.35, initialPage: 0);

  _handlePageListener() {
    setState(() {
      currentPage = _pageController.page!;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_handlePageListener);
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Center(
                  child: Text(
                'Coffee Shop',
                style: TextStyle(fontSize: 28),
              )),
              Expanded(
                child: Transform.scale(
                  alignment: Alignment.bottomCenter,
                  scale: 2,
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final result = currentPage - index + 1;
                      final value = -0.4 * result + 1;
                      if (index == 0) {
                        return const SizedBox.shrink();
                      }

                      return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..scale(value)
                            ..translate(
                                0.0,
                                MediaQuery.of(context).size.height /
                                    3 *
                                    (1 - value).abs()),
                          child: Opacity(
                              opacity: value.clamp(0.0, 1.0),
                              child: Image.asset(images[index])));
                    },
                    itemCount: images.length,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
