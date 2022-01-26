import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  const FlipCard({Key? key}) : super(key: key);

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  bool opened = false;
  late final Animation movePositon;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        reverseDuration: const Duration(milliseconds: 1000),
        vsync: this,
        duration: const Duration(milliseconds: 1000));
    movePositon = Tween(begin: 0.0, end: 100.0).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (_animationController.status != AnimationStatus.completed) {
                  _animationController.forward();
                  opened = true;
                }
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Offset(movePositon.value, 0),
                  child: Stack(
                    children: [
                      Image.network(
                        'https://images.unsplash.com/photo-1494253109108-2e30c049369b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwZm9vZCUyMHN0b3JlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      Transform(
                        transform: Matrix4.identity()
                          ..rotateY(3.14 * _animationController.value),
                        child: _animationController.value < 0.5
                            ? Container(
                                width: 150,
                                height: 150,
                                child: const Center(
                                    child: Text(
                                  'Hi',
                                  style: TextStyle(color: Colors.white),
                                )),
                                color: Colors.deepPurple,
                              )
                            : SizedBox(
                                width: 150,
                                height: 150,
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()..rotateY(3.14),
                                  child: Image.network(
                                    'https://t3.ftcdn.net/jpg/03/67/35/72/360_F_367357209_BG07SVnnB4HSHSaMiHajfZhrZZAE859A.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                opened
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _animationController.reverse();
                            opened = !opened;
                          });
                        },
                        child: const Text('Close card'))
                    : ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _animationController.forward();
                            opened = !opened;
                          });
                        },
                        child: const Text('Open card'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
