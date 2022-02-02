import 'dart:math';

import 'package:flutter/material.dart';

class Carousel2 extends StatefulWidget {
  const Carousel2({Key? key}) : super(key: key);

  @override
  _Carousel2State createState() => _Carousel2State();
}

class _Carousel2State extends State<Carousel2> {
  late final PageController _pageController;
  int currentIndex = 1;
  double moveDistance = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel 2'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                currentIndex = value;
              },
              itemBuilder: (context, index) {
                final move = _pageController.offset / size;
                moveDistance = move;

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.deepPurple,
                  height: 70,
                  child: Center(
                      child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  )),
                );
              },
              itemCount: 5,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            // color: Colors.red,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Dot(),
                    Dot(),
                    Dot(),
                    Dot(),
                    Dot(),
                  ],
                ),
                Positioned(
                  left: (moveDistance) * 25,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          )),
          const Spacer()
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 15,
      height: 15,
      decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(7.5)),
    );
  }
}
