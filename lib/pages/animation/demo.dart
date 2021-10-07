/*
 * @Author: MarioGo
 * @Date: 2021-10-05 15:52:29
 * @LastEditTime: 2021-10-07 16:53:39
 * @LastEditors: MarioGo
 * @Description: 计时器
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
  int _counter = 0;
  _onClick() {
    setState(() {
      _counter++;
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
              color: Colors.blue,
              child: Row(
                children: [
                  AnimatedCounter(
                    value: _counter,
                    duration: Duration(seconds: 2),
                  ),
                  // AnimatedCounter(
                  //   value: 2,
                  //   duration: Duration(seconds: 1),
                  // ),
                  // AnimatedCounter(
                  //   value: 3,
                  //   duration: Duration(seconds: 1),
                  // ),
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
    return TweenAnimationBuilder(
      duration: duration,
      tween: Tween(end: value.toDouble()),
      builder: (BuildContext context, value, Widget? child) {
        final val = value as double;
        final int whole = val ~/ 1;
        final double decimal = val - whole; // this.value - 10;
        return Stack(
          children: [
            Positioned(
                top: decimal * 100, //1.0 --- 0.0,
                child: Opacity(
                  opacity: 1.0 - decimal, // 1 ---- 0 隐藏
                  child: Text(
                    "$whole",
                    style: TextStyle(fontSize: 100),
                  ),
                )),
            Positioned(
                top: 100 - (decimal * 100), //100 - 0
                child: Opacity(
                  opacity: decimal, // 0 --- 1
                  child: Text(
                    "${whole + 1}",
                    style: TextStyle(fontSize: 100),
                  ),
                )),
          ],
        );
      },
    );
  }
}
