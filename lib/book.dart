import 'dart:math';

import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> with TickerProviderStateMixin {
  late final AnimationController _openBook;
  late final AnimationController _closeBook;
  late final AnimationController _moveRightBook;
  late final AnimationController _moveLeftBook;
  bool _bookOpened = false;

  @override
  void initState() {
    super.initState();
    _openBook = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _closeBook = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _moveRightBook = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _moveLeftBook = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    // _rightSwipe =
    //     Tween(begin: 0.0, end: 1.0).animate(_openBook);
    // _leftSwipe = Tween(begin: 0.0, end: 1.0).animate(_openBook);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (!_bookOpened) {
                  _openBook.forward();
                  _moveRightBook.forward();
                } else {
                  _closeBook.forward();
                  _moveLeftBook.forward();
                }
                _bookOpened = !_bookOpened;
              });
            },
            child: AnimatedBuilder(
              animation: _moveRightBook,
              builder: (context, child) => Transform(
                transform: Matrix4.identity()
                  ..translate(_bookOpened
                      ? (size.width / 5) * _moveRightBook.value
                      : -((size.width / 5) * _moveLeftBook.value)),
                child: SizedBox(
                  width: size.width * 0.4,
                  height: size.height * 0.4,
                  child: Stack(
                    children: [
                      AnimatedBuilder(
                        animation: _closeBook,
                        builder: (context, child) => Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..rotateY(-pi)
                              ..setEntry(3, 2, 0.001),
                            child: Image.asset('assets/back.jpg')),
                      ),
                      AnimatedBuilder(
                        animation: _openBook,
                        builder: (context, child) => Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateY(-(_openBook.value * pi)),
                            child: Image.asset('assets/cover.jpg')),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
