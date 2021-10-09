/*
 * @Author: MarioGo
 * @Date: 2021-10-08 17:23:25
 * @LastEditTime: 2021-10-09 22:33:03
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/eventBus/childComp.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */

import 'package:flutter/material.dart';
import 'package:flutter_24/pages/demo/shopping/share_data.dart';
import 'package:flutter_24/pages/eventBus/eventBus.dart';

class EventChildCompPage extends StatefulWidget {
  const EventChildCompPage({Key? key}) : super(key: key);

  @override
  State<EventChildCompPage> createState() => _EventChildCompPageState();
}

class _EventChildCompPageState extends State<EventChildCompPage> {
  int count = 0;
  var _eventBusOn; //记录事件监听事件，用于取消事件监听
  @override
  void initState() {
    super.initState();
    /**
 * 监听广播（只监听ProductDetailEvent广播事件）
 * 需要注意的是，如果不写尖括号里面的内容（<ProductDetailEvent>），那么表示监听所有广播
 */
    this._eventBusOn = eventBus.on<ProductDetailEvent>().listen((event) {
      print("派发了监听");
      _addCount(event.count);
      // _showFilterBottomSheet();
    });
  }

  void _addCount(int num) {
    print(num);
    setState(() {
      count = num;
    });
  }

  //销毁
  @override
  void dispose() {
    this._eventBusOn.cancel(); //取消事件监听
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: "价格总数是"),
      TextSpan(
          text: "$count",
          style: TextStyle(color: Color(0xFFfd79a8), fontSize: 33))
    ]));
  }
}
