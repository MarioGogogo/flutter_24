/*
 * @Author: MarioGo
 * @Date: 2021-10-10 14:56:24
 * @LastEditTime: 2021-10-10 19:36:43
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/provider/index.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import 'switcher.dart';
import 'counter.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider-状态管理"),
        actions: <Widget>[
          TextButton(
            child: Text("下一页"),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondPage();
            })),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text("${Provider.of<Counter>(context).count}"),
            SizedBox(
              height: 40,
            ),
            Text("${Provider.of<Customer>(context).name}"),
            SizedBox(
              height: 40,
            ),
            Switch(
                value: context.watch<Switcher>().status,
                onChanged: (value) {
                  context.read<Switcher>().changeStatus();
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<Counter>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<String>(context)),
      ),
      body: Center(
        child: Column(
          children: [
            Text("${context.watch<Counter>().count}"),
            SizedBox(
              height: 40,
            ),
            Switch(
                value: context.watch<Switcher>().status,
                onChanged: (value) {
                  context.read<Switcher>().changeStatus();
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<Counter>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
