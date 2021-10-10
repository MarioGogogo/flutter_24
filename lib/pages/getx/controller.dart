/*
 * @Author: MarioGo
 * @Date: 2021-10-10 20:51:44
 * @LastEditTime: 2021-10-10 21:57:14
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/getx/controller.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:get/get.dart';

/// 计数器控制器
class CounterController extends GetxController {
  var count = 0.obs;

  final name = ''.obs;
  final isLogged = false.obs;
  final balance = 0.0.obs;
  final number = 0.obs;
  final items = <String>[].obs;
  final myMap = <String, int>{}.obs;

// 甚至自定义类 - 可以是任何类
  final user = User().obs;
}

class User {
  User();
}

// 值得注意的是，因为现在flutter 有了null-safety，所以我们最好给响应式变量一个初始值。

// 假设项目比较小，那Obx可能会比较好，很快很方便，如果是项目比较大，我建议使用GetBuilder会比较好，因为性能会比较好。