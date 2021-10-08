/*
 * @Author: MarioGo
 * @Date: 2021-10-08 11:31:05
 * @LastEditTime: 2021-10-08 16:20:29
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/eventHandler/index.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';

class EeventHandlePage extends StatefulWidget {
  const EeventHandlePage({Key? key}) : super(key: key);

  @override
  State<EeventHandlePage> createState() => _EeventHandlePageState();
}

class _EeventHandlePageState extends State<EeventHandlePage> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Color(0xFF74b9ff),
        width: 300.0,
        height: 150.0,
        child: Text(
          '${_event?.toString() ?? ''}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => setState(() => _event = event),
      onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
      onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
    );
  }
}
