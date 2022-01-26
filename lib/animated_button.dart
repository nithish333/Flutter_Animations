import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({Key? key}) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation widthAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 17, color: Colors.white);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (_animationController.status != AnimationStatus.completed) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) => Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: 0,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.shade800,
                        ),
                        width: MediaQuery.of(context).size.width *
                            0.6 *
                            _animationController.value,
                        height: 60,
                      ),
                    )),
                Positioned(
                    child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) =>
                            _animationController.value > 0 &&
                                    _animationController.value < 1
                                ? Text(
                                    'Submitting...',
                                    style: textStyle,
                                  )
                                : _animationController.value == 0
                                    ? Text(
                                        'SUBMIT',
                                        style: textStyle,
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.done,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'DONE',
                                            style: textStyle,
                                          ),
                                        ],
                                      )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
