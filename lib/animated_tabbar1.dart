import 'package:flutter/material.dart';

class AnimatedTabBar1 extends StatefulWidget {
  const AnimatedTabBar1({Key? key}) : super(key: key);

  @override
  _AnimatedTabBar1State createState() => _AnimatedTabBar1State();
}

class _AnimatedTabBar1State extends State<AnimatedTabBar1>
    with SingleTickerProviderStateMixin {
  int index = 0;
  late final AnimationController _animationController;
  late final Animation moveAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final containerWIdth = size - 40;
    final si = ((containerWIdth - 40) / 5);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated TabBar 1'),
      ),
      body: Center(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.only(left: 20, right: 20),
        width: size,
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(offset: Offset(0, 2), blurRadius: 7, color: Colors.grey)
            ]),
        child: Stack(
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: index * si, end: index * si),
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceOut,
              builder: (context, value, child) => Positioned(
                  top: 0,
                  left: value,
                  child: SizedBox(
                    width: si,
                    height: 70,
                    child: CustomPaint(
                      painter: NotchColor(),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: SizedBox(
                      width: si,
                      child: const Icon(Icons.home_outlined),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: SizedBox(
                      width: si,
                      child: const Icon(Icons.search_outlined),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    child: SizedBox(
                      width: si,
                      child: const Icon(Icons.favorite_outline),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 3;
                      });
                    },
                    child: SizedBox(
                      width: si,
                      child: const Icon(Icons.notifications_outlined),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 4;
                        });
                      },
                      child: SizedBox(
                          width: si, child: const Icon(Icons.person_outline))),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class NotchColor extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var bgPaint = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(7.5, 0, 12, 5);
    path.quadraticBezierTo(size.width / 2, size.height / 2, size.width - 12, 5);
    path.quadraticBezierTo(size.width - 7.5, 0, size.width, 0);
    path.close();

    canvas.drawPath(path, bgPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
