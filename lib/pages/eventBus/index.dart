/*
 * @Author: MarioGo
 * @Date: 2021-10-08 16:43:29
 * @LastEditTime: 2021-10-09 22:37:38
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/eventBus/index.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';
import 'package:flutter_24/pages/demo/shopping/share_data.dart';
import 'package:flutter_24/pages/eventBus/childComp.dart';
import 'package:flutter_24/pages/eventBus/eventBus.dart';

class EventBusPage extends StatefulWidget {
  EventBusPage({Key? key}) : super(key: key);

  @override
  _EventBusPageState createState() => _EventBusPageState();
}

class _EventBusPageState extends State<EventBusPage> {
  late int money = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车-EventBus管理"),
      ),
      body: Center(
        child: ShareDataWidget(
          data: money,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EventChildCompPage(), //子集
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    //广播
                    setState(() {
                      money = money + 10;
                    });
                    eventBus.fire(ProductDetailEvent("加入购物车传入的参数", money));
                  },
                  child: Text("添加商品")),
              ElevatedButton(
                onPressed: () {},
                child: Text("跳转结账"),
                style: ElevatedButton.styleFrom(primary: Color(0xFFfd79a8)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
