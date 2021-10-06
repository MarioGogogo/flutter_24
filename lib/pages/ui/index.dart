/*
 * @Author: MarioGo
 * @Date: 2021-10-05 20:52:41
 * @LastEditTime: 2021-10-05 21:01:08
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/ui/index.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';
import 'package:flutter_24/components/my_header.dart';

class HeaderUIPage extends StatelessWidget {
  const HeaderUIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "All you need",
              textBottom: "is stay at home.",
              offset: 0,
            ),
          ],
        ),
      ),
    );
  }
}
