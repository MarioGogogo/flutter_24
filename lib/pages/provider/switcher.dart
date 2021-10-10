/*
 * @Author: MarioGo
 * @Date: 2021-10-10 16:27:14
 * @LastEditTime: 2021-10-10 17:43:45
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/provider/switcher.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';

class Switcher with ChangeNotifier {
  bool status = true;

  changeStatus() {
    status = !status;
    notifyListeners();
  }
}
