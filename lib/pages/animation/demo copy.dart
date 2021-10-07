/*
 * @Author: MarioGo
 * @Date: 2021-10-05 15:52:29
 * @LastEditTime: 2021-10-07 12:02:33
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/animation/demo.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */

import 'package:flutter/material.dart';

class ScaleAnimationPage extends StatelessWidget {
  const ScaleAnimationPage({Key? key}) : super(key: key);

  _onClick() {
    print("点击");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画demo"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: 300,
          height: 300,
          color: Colors.orange,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClick,
        tooltip: "Increment",
        child: Icon(Icons.face),
      ),
    );
  }
}
