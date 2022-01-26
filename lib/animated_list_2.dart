import 'package:flutter/material.dart';

class AnimatedList2 extends StatefulWidget {
  const AnimatedList2({Key? key}) : super(key: key);

  @override
  _AnimatedList2State createState() => _AnimatedList2State();
}

class _AnimatedList2State extends State<AnimatedList2>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;

  double angle = 0;
  bool isScrolling = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   print(_scrollController.offset);
    // });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List 2'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            setState(() {
              angle = -0.2;
              isScrolling = true;
            });
          } else {
            setState(() {
              angle = 0;
              isScrolling = false;
            });
          }
          return true;
        },
        child: TweenAnimationBuilder(
          tween: Tween(
              begin: isScrolling ? 0.0 : -0.3, end: isScrolling ? -0.3 : 0.0),
          duration: const Duration(milliseconds: 200),
          builder: (context, value, child) => ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateX(isScrolling ? angle : 0.0),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      color: Colors.amber,
                      width: 50,
                    ),
                    title: Text('Title ${index + 1}'),
                    subtitle: Text('Subtitle ${index + 1}'),
                  ),
                ),
              ),
            ),
            itemCount: 50,
          ),
        ),
      ),
    );
  }
}
