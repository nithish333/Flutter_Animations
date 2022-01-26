import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedButton2 extends StatefulWidget {
  const AnimatedButton2({Key? key}) : super(key: key);

  @override
  _AnimatedButton2State createState() => _AnimatedButton2State();
}

class _AnimatedButton2State extends State<AnimatedButton2>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation _squareToCircleController;
  late final Animation _borderRadius;
  late final Animation _circluarIndicator;
  late final Animation _progressIndicator;
  late final Animation _circleToSquareController;
  late final Animation _squareBorderRadius;
  bool started = false;
  bool circleCompleted = false;
  bool progressCompleted = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 8000));
    _squareToCircleController = Tween(begin: 200.0, end: 70.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.0, 0.05)));
    _borderRadius = Tween(begin: 10.0, end: 35.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.0, 0.05)));

    _circluarIndicator = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.01, 0.15)));

    _progressIndicator = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.25, 0.9)));

    _circleToSquareController = Tween(begin: 70.0, end: 200.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.95, 1)));
    _squareBorderRadius = Tween(begin: 35.0, end: 10.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.95, 1)));
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Animated Button 2'),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              if (_animationController.status != AnimationStatus.completed) {
                _animationController.forward();
                started = true;
                Future.delayed(const Duration(milliseconds: 2000), () {
                  circleCompleted = true;
                });

                Future.delayed(const Duration(milliseconds: 7600), () {
                  progressCompleted = true;
                });
              }
            });
          },
          child: Center(
            child: Container(
              width: progressCompleted
                  ? _circleToSquareController.value
                  : _squareToCircleController.value,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(progressCompleted
                      ? _squareBorderRadius.value
                      : _borderRadius.value)),
              height: 70,
              child: Center(
                  child: progressCompleted
                      ? const Text(
                          'Open ',
                          style: TextStyle(fontSize: 21, color: Colors.white),
                        )
                      : started && circleCompleted
                          ? Stack(
                              children: [
                                Positioned(
                                  top: 22.5,
                                  left: 22.5,
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: CustomPaint(
                                    painter: ProgressPainter(
                                        progress: _progressIndicator.value),
                                  ),
                                )
                              ],
                            )
                          : started
                              ? Opacity(
                                  opacity: _circluarIndicator.value,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'Download',
                                  style: TextStyle(
                                      fontSize: 21, color: Colors.white),
                                )),
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 4.0;
    const color = Colors.white;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - strokeWidth;

    final foreGorundPaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..style = PaintingStyle.stroke;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        2 * pi * progress, false, foreGorundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
