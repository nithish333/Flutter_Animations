import 'package:flutter/material.dart';

class AnimatedList3 extends StatefulWidget {
  const AnimatedList3({Key? key}) : super(key: key);

  @override
  _AnimatedList3State createState() => _AnimatedList3State();
}

class _AnimatedList3State extends State<AnimatedList3> {
  late final ScrollController _scrollController;

  _handleScroll() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List 3'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemBuilder: (context, index) {
          final itemOffset = index * 150;
          final diff = _scrollController.offset - itemOffset;
          final percent = diff / 150;
          double value = 1 - percent;

          if (value > 1) value = 1;
          if (value < 0) value = 0;
          return Opacity(
            opacity: value,
            child: Transform.scale(
              alignment: Alignment.center,
              scale: value,
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
      ),
    );
  }
}
