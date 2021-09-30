/*
 * @Author: MarioGo
 * @Date: 2021-09-26 21:55:20
 * @LastEditTime: 2021-09-27 22:23:38
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/components/LoadingDialog.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'dart:async';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingDialog extends Dialog {
  String? content;

  LoadingDialog({this.content});

  _showTimer(context) {
    var timer;
    timer = Timer.periodic(Duration(milliseconds: 3000), (t) {
      Navigator.pop(context);
      t.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    _showTimer(context);
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: 300,
          height: 100,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(width: 30),
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(left: 26.0),
                child: Text(
                  "${this.content != null ? this.content : '正在加载...请稍后...'}",
                  style: TextStyle(fontSize: 16, color: Colors.black38),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
