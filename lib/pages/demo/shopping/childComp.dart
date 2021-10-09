/*
 * @Author: MarioGo
 * @Date: 2021-10-08 17:23:25
 * @LastEditTime: 2021-10-09 17:29:19
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/demo/shopping/childComp.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */

import 'package:flutter/material.dart';
import 'package:flutter_24/pages/demo/shopping/changeNotifierProviderState.dart';
import 'package:flutter_24/pages/demo/shopping/share_data.dart';

import 'package:flutter_24/pages/demo/shopping/shoppingpage.dart';

import 'cart_model.dart';

class ChildCompPage extends StatefulWidget {
  const ChildCompPage({Key? key}) : super(key: key);

  @override
  State<ChildCompPage> createState() => _ChildCompPageState();
}

class _ChildCompPageState extends State<ChildCompPage> {
  @override
  Widget build(BuildContext context) {
    //获取值
    var cart = ChangeNotifierProvider.of<CartModel>(context);
    print("object,,,$cart");
    return Text.rich(TextSpan(children: [
      TextSpan(text: "价格总数是"),
      TextSpan(
          // text: ShareDataWidget.of(context)!.data.toString(),
          text: "${cart.totalPrice}",
          style: TextStyle(color: Color(0xFFfd79a8), fontSize: 33))
    ]));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print(
      "Dependencies change",
    );
  }
}
