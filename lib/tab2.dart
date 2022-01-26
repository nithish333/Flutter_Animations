import 'package:flutter/material.dart';

class TAB2 extends StatefulWidget {
  const TAB2({Key? key}) : super(key: key);

  @override
  _TAB2State createState() => _TAB2State();
}

class _TAB2State extends State<TAB2> {
  double width = 10;
  double height = 60;
  double endV = 10;

  checkWidth(context, val) {
    // double size = MediaQuery.of(context).size.width;
    // double newWidth = size - 40;

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('You reached max size'),
        content: const Text('What do you want me to do?'),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  width = 10;
                  endV = 10;
                  Navigator.of(context).pop();
                });
              },
              child: const Text('Decrement')),
          TextButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: const Text('Remain same'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 10, end: endV),
              duration: const Duration(seconds: 6),
              builder: (context, value, child) {
                // print(value);
                return Container(
                  width: value,
                  height: height,
                  color: Colors.deepPurple,
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Slider(
              value: endV,
              onChanged: (val) {
                if (val == 200) {
                  checkWidth(context, val);
                }
                setState(() {
                  width = val;
                  endV = val;
                });
              },
              min: 10,
              max: 200,
            )
          ],
        ),
      ),
    );
  }
}
