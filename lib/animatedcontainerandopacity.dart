import 'package:flutter/material.dart';

class AnimatedContainerAndOpacity extends StatefulWidget {
  const AnimatedContainerAndOpacity({Key? key}) : super(key: key);

  @override
  _AnimatedContainerAndOpacityState createState() =>
      _AnimatedContainerAndOpacityState();
}

class _AnimatedContainerAndOpacityState
    extends State<AnimatedContainerAndOpacity> {
  double width = 100;
  double height = 100;
  double opacity = 1;
  int cindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                cindex = index;
                if (index == 0) {
                  width = 100;
                  height = 100;
                  opacity = 1;
                }
                if (index == 1) {
                  width = 200.0;
                  height = 200.0;
                }

                if (index == 2) {
                  opacity = opacity == 1 ? 0.2 : 1;
                }
              });
            },
            currentIndex: cindex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.undo), label: 'Undo'),
              BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Animate'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.opacity), label: 'Opacity'),
            ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: opacity,
                child: AnimatedContainer(
                  curve: Curves.easeInCirc,
                  duration: const Duration(seconds: 2),
                  width: width,
                  height: height,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ));
  }
}
