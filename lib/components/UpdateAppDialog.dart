/*
 * @Author: MarioGo
 * @Date: 2021-09-26 23:17:43
 * @LastEditTime: 2021-09-27 23:08:34
 * @LastEditors: MarioGo
 * @Description: 升级app弹窗
 * @FilePath: /flutter_24/lib/components/UpdateAppDialog.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';

class UpdateAppDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Stack(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.expand(), //随着子元素扩展
              child: Image.asset(
                "lib/images/update.jpg",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Text("1.优化更多功能"),
            )
          ],
        ));
  }
}
