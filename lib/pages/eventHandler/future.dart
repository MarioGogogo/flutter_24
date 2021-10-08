/*
 * @Author: MarioGo
 * @Date: 2021-10-08 16:30:01
 * @LastEditTime: 2021-10-08 16:39:01
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/eventHandler/future.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  FuturePage({Key? key}) : super(key: key);

  @override
  _FuturePageState createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("异步ui更新"),
      ),
      body: Center(
        child: FutureBuilder(
            future: mockNetMock(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("Error");
                } else {
                  return Text("Success!!!! ");
                }
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}

Future<String> mockNetMock() async {
  return Future.delayed(Duration(seconds: 3), () => "我是互联网过来的数据");
}
