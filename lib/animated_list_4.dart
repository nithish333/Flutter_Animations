import 'package:flutter/material.dart';

class AnimatedList4 extends StatefulWidget {
  const AnimatedList4({Key? key}) : super(key: key);

  @override
  _AnimatedList4State createState() => _AnimatedList4State();
}

class _AnimatedList4State extends State<AnimatedList4> {
  late final ScrollController _scrollController;

  _handleScroll() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Animated List 4'),
        ),
        body: ListView.builder(
          controller: _scrollController,
          itemBuilder: (context, index) {
            final itemOffset = _scrollController.offset - index * 150;
            final percent = itemOffset / 150;
            double value = percent;
            double opacityValue = 1 - value;
            if (value > 1) value = 1;
            if (value < 0) value = 0;
            if (opacityValue > 1) opacityValue = 1;
            if (opacityValue < 0) opacityValue = 0;
            return Opacity(
              opacity: opacityValue,
              child: Transform(
                transform: Matrix4.identity()..translate(value * size),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 150,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Coffee ${index + 1}'),
                          Image.asset(
                            'assets/${index + 1}.png',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: 12,
        ));
  }
}
