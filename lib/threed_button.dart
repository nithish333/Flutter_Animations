import 'package:flutter/material.dart';

class ThreeDButton extends StatefulWidget {
  const ThreeDButton({Key? key}) : super(key: key);

  @override
  _ThreeDButtonState createState() => _ThreeDButtonState();
}

class _ThreeDButtonState extends State<ThreeDButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _value;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  void _handleTap() {
    _animationController.forward();

    Future.delayed(const Duration(milliseconds: 400), () {
      _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _handleTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 60,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          spreadRadius: 4,
                          color: Colors.grey.shade300)
                    ],
                    color: Colors.red[900],
                    borderRadius: BorderRadius.circular(30)),
              ),
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) => Container(
                  transform: Matrix4.translationValues(
                      0, (_animationController.value * (10)) - 10, 0),
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Text(
                      'PUSH ME',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
