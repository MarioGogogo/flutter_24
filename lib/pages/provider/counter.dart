/*
 * @Author: MarioGo
 * @Date: 2021-10-10 16:26:38
 * @LastEditTime: 2021-10-10 19:46:53
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/provider/counter.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  String _name = "";
  int _age = 99;
  String _sex = "";
  List<int> _data = [];
  List<dynamic> _formatData = [];
  Object  _info = {};

  int get age => _age;
  int get count => _count;

  increment() {
       _count++;
    notifyListeners();
  }

  setAge(age) {
    _age = age;
    notifyListeners();
  }

  setData() {
    _data = [1,2,3,4,5];
    notifyListeners();
  }
}
