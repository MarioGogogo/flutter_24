/*
 * @Author: MarioGo
 * @Date: 2021-10-05 15:52:29
 * @LastEditTime: 2021-10-07 14:33:07
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/animation/demo.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */

import 'package:flutter/material.dart';

class ScaleAnimationPage extends StatefulWidget {
  const ScaleAnimationPage({Key? key}) : super(key: key);

  @override
  State<ScaleAnimationPage> createState() => _ScaleAnimationPageState();
}

class _ScaleAnimationPageState extends State<ScaleAnimationPage> {
  late int _counter = 0;
  _onClick() {
    setState(() {
      _counter = _counter + 1;
    });
    print("点击");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画demo"),
      ),
      body: Center(
          child: Container(
              width: 300,
              height: 120,
              child: Row(
                children: [
                  AnimatedCounter(
                    value: 1,
                    duration: Duration(seconds: 1),
                  ),
                  AnimatedCounter(
                    value: 2,
                    duration: Duration(seconds: 1),
                  ),
                  AnimatedCounter(
                    value: 3,
                    duration: Duration(seconds: 1),
                  ),
                ],
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClick,
        tooltip: "Increment",
        child: Icon(Icons.face),
      ),
    );
  }
}

class AnimatedCounter extends StatelessWidget {
  final Duration duration;
  final int value;

  const AnimatedCounter({Key? key, required this.duration, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late double whole;
    late double decimal;
    return TweenAnimationBuilder(
      duration: duration,
      tween: Tween(end: value.toDouble()),
      builder: (BuildContext context, value, child) {
        print("object$value");
        whole = 1;
        decimal = 0.44; // this.value - 10;
        return Stack(
          children: [
            Positioned(
                top: decimal * 100, //1.0 --- 0.0,
                child: Opacity(
                  opacity: 1.0 - decimal,
                  child: Text(
                    "$whole",
                    style: TextStyle(fontSize: 100),
                  ),
                )),
            Positioned(
                top: 100 - (decimal * 100), //100 - 0
                child: Opacity(
                  opacity: 1.0 - decimal,
                  child: Text(
                    "$whole",
                    style: TextStyle(fontSize: 100),
                  ),
                )),
          ],
        );
      },
    );
  }
}
