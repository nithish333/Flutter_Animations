import 'package:example1/animated_button.dart';
import 'package:example1/animated_button_2.dart';
import 'package:example1/animated_carousel_1.dart';
import 'package:example1/animated_list_1.dart';
import 'package:example1/animated_list_2.dart';
import 'package:example1/animated_list_3.dart';
import 'package:example1/animated_list_4.dart';
import 'package:example1/animated_menu_1.dart';
import 'package:example1/animatedcontainerandopacity.dart';
import 'package:example1/book.dart';
import 'package:example1/flip_card.dart';
import 'package:example1/matrix_transforms.dart';
import 'package:example1/tab2.dart';
import 'package:example1/threed_button.dart';
import 'package:example1/tweenanimation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double width = 100;
  double height = 100;
  double opacity = 1;
  int cindex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        routes: {
          '/acao': (_) => const AnimatedContainerAndOpacity(),
          '/tab': (_) => const TweenAnimation(),
          '/tab2': (_) => const TAB2(),
          '/mat': (_) => const MatrixTransforms(),
          '/animatedbutton': (_) => const AnimatedButton(),
          '/threedbutton': (_) => const ThreeDButton(),
          '/animatedcarousel1': (_) => const AnimatedCarousel1(),
          '/flipcard': (_) => const FlipCard(),
          '/animatedmenu1': (_) => const AnimatedMenu1(),
          '/animatedlist1': (_) => const AnimatedList1(),
          '/book': (_) => const Book(),
          '/animatedlist2': (_) => const AnimatedList2(),
          '/animatedlist3': (_) => const AnimatedList3(),
          '/animatedlist4': (_) => const AnimatedList4(),
          '/animatedbutton2': (_) => const AnimatedButton2()
        },
        home: const NewHome());
  }
}

class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animations in Flutter'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          children: [
            const Heading(s: 'Basics in Animations'),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/acao');
              },
              child: const Card(
                child: ListTile(
                    title: Text('AnimatedContainerAndOpacity'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 17,
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/tab');
              },
              child: const Card(
                child: ListTile(
                    title: Text('Tween Animation Builder 1'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 17,
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/tab2');
              },
              child: const Card(
                child: ListTile(
                    title: Text('Tween Animation Builder 2'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 17,
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/mat');
              },
              child: const Card(
                child: ListTile(
                    title: Text('Matrix Transforms'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 17,
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //////////! BUTTONS  //////////

            const Heading(s: 'Buttons'),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/threedbutton');
              },
              child: const Card(
                child: ListTile(
                    title: Text('3-D Button'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 17,
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/animatedbutton');
              },
              child: const Card(
                child: ListTile(
                    title: Text('Animated Button 1'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 17,
                    )),
              ),
            ),

            const GestureCard(
                routeName: '/animatedbutton2', title: 'Animated Button 2'),

            const SizedBox(
              height: 20,
            ),

            //////////! LISTS  //////////

            const Heading(s: 'Lists'),
            const GestureCard(
                routeName: '/animatedlist1', title: 'Animated List 1'),
            const GestureCard(
                routeName: '/animatedlist2', title: 'Animated List 2'),
            const GestureCard(
                routeName: '/animatedlist3', title: 'Animated List 3'),
            const GestureCard(
                routeName: '/animatedlist4', title: 'Animated List 4'),
            const SizedBox(
              height: 20,
            ),

            //////////! CAROUSEL  //////////

            const Heading(s: 'Carousel'),
            const GestureCard(
                routeName: '/animatedcarousel1', title: 'Carousel 1'),
            const SizedBox(
              height: 20,
            ),

            //////////! MENU  //////////

            const Heading(s: 'Menu'),
            const GestureCard(
                routeName: '/animatedmenu1', title: 'Animated Menu 1'),
            const SizedBox(
              height: 20,
            ),

            //////////! RANDOM EFFECTS  //////////

            const Heading(s: 'Random Effects'),
            const GestureCard(routeName: '/flipcard', title: 'Flip Card'),
            const GestureCard(
                routeName: '/book', title: 'A literal BOOK (not done)'),
          ],
        ));
  }
}

class GestureCard extends StatelessWidget {
  final String routeName;
  final String title;
  const GestureCard({Key? key, required this.routeName, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Card(
        child: ListTile(
            title: Text(title),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 17,
            )),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  final String s;
  const Heading({Key? key, required this.s}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s,
          style: const TextStyle(fontSize: 30),
        ),
        Divider(
          color: Colors.grey.shade400,
        ),
      ],
    );
  }
}
