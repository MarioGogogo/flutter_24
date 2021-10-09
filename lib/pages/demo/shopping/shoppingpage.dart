/*
 * @Author: MarioGo
 * @Date: 2021-10-08 16:43:29
 * @LastEditTime: 2021-10-09 17:28:43
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/demo/shopping/shoppingpage.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */

import 'package:flutter/material.dart';
import 'package:flutter_24/pages/demo/shopping/changeNotifierProviderState.dart';
import 'package:flutter_24/pages/demo/shopping/share_data.dart';

import 'cart_model.dart';
import 'childComp.dart';

class ShoppingPage extends StatefulWidget {
  ShoppingPage({Key? key}) : super(key: key);

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  late int money = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车-全局状态管理"),
      ),
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChildCompPage(), //子集
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    //给购物车中添加商品，添加后总价会更新
                    ChangeNotifierProvider.of<CartModel>(context)
                        .add(Item(20.0, 1));
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
