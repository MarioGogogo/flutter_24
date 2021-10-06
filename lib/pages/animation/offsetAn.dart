/*
 * @Author: MarioGo
 * @Date: 2021-10-05 22:38:56
 * @LastEditTime: 2021-10-05 23:01:31
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/animation/offsetAn.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */

import 'package:flutter/material.dart';

class OffsetPage extends StatelessWidget {
  const OffsetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("位移"),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(seconds: 3),
          tween: Tween(begin: Offset(0.0, -10.0), end: Offset(20.0, 0.0)),
          builder: (context, value, child) {
            return Container(
              width: 300,
              height: 300,
              color: Colors.blue,
              child: Container(
                child: Transform.translate(
                  offset: Offset(0, 90),
                  child: Text(
                    "我现在要移动了",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
