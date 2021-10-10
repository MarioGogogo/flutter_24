/*
 * @Author: MarioGo
 * @Date: 2021-09-21 15:33:59
 * @LastEditTime: 2021-10-10 19:44:06
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/main.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'common/routes/app_pages.dart';
import 'pages/provider/counter.dart';
import 'pages/provider/switcher.dart';

class Customer with ChangeNotifier {
  String name = "snowMan";
}

Future<void> main() async {
  //注册
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Customer()),
      ChangeNotifierProvider(create: (_) => Counter()),
      ChangeNotifierProvider(create: (_) => Switcher()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(platform: TargetPlatform.iOS),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
    );
  }
}
