import 'dart:math';

import 'package:flutter/material.dart';

class MatrixTransforms extends StatefulWidget {
  const MatrixTransforms({Key? key}) : super(key: key);

  @override
  State<MatrixTransforms> createState() => _MatrixTransformsState();
}

class _MatrixTransformsState extends State<MatrixTransforms> {
  double moveX = 0;
  double moveY = 0;
  double rotateX = 0;
  double rotateY = 0;
  double rotateZ = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Transform(
                transform: Matrix4.translationValues(moveX, moveY, 0) *
                    Matrix4.rotationX(rotateX) *
                    Matrix4.rotationY(rotateY) *
                    Matrix4.rotationZ(rotateZ),
                child: Container(
                  color: Colors.deepPurple,
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text('Move positions'),
              const Divider(),
              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          moveX += 5.0;
                        });
                      },
                      child: const Text('Move X by 5')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          moveY += 5.0;
                        });
                      },
                      child: const Text('Move Y by 5')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          moveX -= 5.0;
                        });
                      },
                      child: const Text('Move X by -5')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          moveY -= 5.0;
                        });
                      },
                      child: const Text('Move Y by -5'))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Rotations'),
              const Divider(),
              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          rotateX += 90.0;
                        });
                      },
                      child: const Text('Rotate X by 90')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          rotateY += 5.0;
                        });
                      },
                      child: const Text('Rotate Y by 90')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          rotateZ += 90.0;
                        });
                      },
                      child: const Text('Rotate Z by 90')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          rotateX -= 90.0;
                        });
                      },
                      child: const Text('Rotate X by -90')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          rotateY -= 90.0;
                        });
                      },
                      child: const Text('Rotate Y by -90')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          rotateZ -= 90.0;
                        });
                      },
                      child: const Text('Rotate Z by -90'))
                ],
              ),
            ])),
      ),
    );
  }
}
