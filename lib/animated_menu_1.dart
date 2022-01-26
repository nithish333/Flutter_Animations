import 'package:flutter/material.dart';

class AnimatedMenu1 extends StatefulWidget {
  const AnimatedMenu1({Key? key}) : super(key: key);

  @override
  _AnimatedMenu1State createState() => _AnimatedMenu1State();
}

class _AnimatedMenu1State extends State<AnimatedMenu1>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  bool opened = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Scaffold(
          body: Stack(
            children: [
              Container(
                width: size.width,
                padding: const EdgeInsets.all(20),
                color: Colors.black87,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    opened
                        ? AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: _animationController.value,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _animationController.reverse();
                                    opened = !opened;
                                  });
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 28,
                                )),
                          )
                        : Container(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'MENU',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    const Divider(
                      color: Colors.white70,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.home,
                            color: Colors.deepPurple,
                            size: 27,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                                fontSize: 20, color: Colors.deepPurple),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.person,
                            color: Colors.deepPurple,
                            size: 27,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'About',
                            style: TextStyle(
                                fontSize: 20, color: Colors.deepPurple),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.help,
                            color: Colors.deepPurple,
                            size: 27,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Contact us',
                            style: TextStyle(
                                fontSize: 20, color: Colors.deepPurple),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..scale(1 - (0.2 * _animationController.value))
                  ..translate((size.width / 2) * _animationController.value),
                child: Container(
                  width: size.width,
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      !opened
                          ? AnimatedOpacity(
                              opacity: 1 - (_animationController.value),
                              duration: const Duration(milliseconds: 200),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _animationController.forward();
                                    Future.delayed(
                                        const Duration(milliseconds: 200));
                                    opened = !opened;
                                  });
                                },
                                icon: const Icon(
                                  Icons.sort,
                                  size: 27,
                                ),
                              ),
                            )
                          : Container(),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade400,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/flower.jpg',
                                  alignment: Alignment.bottomLeft,
                                  width: size.width,
                                  height: size.height * 0.4,
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.favorite_outline,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.comment,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.share,
                                      size: 30,
                                    )
                                  ],
                                ),
                                const Icon(
                                  Icons.bookmark_outline_rounded,
                                  size: 30,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
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
