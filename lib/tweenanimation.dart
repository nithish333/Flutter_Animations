import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({Key? key}) : super(key: key);

  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  double hue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: hue),
                duration: const Duration(seconds: 1),
                builder: (context, value, child) {
                  final hsvColor = HSVColor.fromAHSV(1, value, 1, 1);
                  return Container(
                    width: 150,
                    height: 150,
                    color: hsvColor.toColor(),
                  );
                }),
            const SizedBox(
              height: 48,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 36,
              decoration: BoxDecoration(
                  gradient: LinearGradient(stops: [
                for (var h = 0; h <= 360; ++h) h.toDouble() / 360
              ], colors: [
                for (double h = 0; h <= 360; ++h)
                  HSVColor.fromAHSV(1, h, 1, 1).toColor()
              ])),
            ),
            const SizedBox(
              height: 48,
            ),
            Slider(
              value: hue,
              onChanged: (val) {
                setState(() {
                  hue = val;
                });
              },
              min: 0,
              max: 360,
            )
          ],
        ),
      ),
    );
  }
}
