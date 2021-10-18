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
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import '../../main.dart';
import 'switcher.dart';
import 'counter.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider6.0-状态管理"),
        actions: <Widget>[
          TextButton(
            child: Text(
              "下一页",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return SecondPage();
              },
            )),
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
        title: Text(Provider.of<Customer>(context).name),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer(builder:
                (BuildContext context, Counter counter, Widget? child) {
              return Text(
                "${counter.count.toString()}",
                style: TextStyle(fontSize: 30),
              );
            }),
            SizedBox(
              height: 40,
            ),
            Consumer(builder:
                (BuildContext context, Switcher switcher, Widget? child) {
              return Switch(
                  value: switcher.status,
                  onChanged: (value) {
                    switcher.changeStatus();
                  });
            }),
            Consumer2(builder:
                (BuildContext context, Switcher switcher,Counter counter,
                Widget? child) {
              return Row(
                 children: [
                    Text("${counter.count.toString()}"),
                   Text("${switcher.status}")
                 ],
              );
            }),
            SizedBox(
              height: 40,
            ),
            Selector<Counter,int>(
                selector: (_,counter) => counter.age,
                builder: (_,age,child){
                   return Text(age.toString(),style: TextStyle(fontSize: 26),);
                },

            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.read<Counter>().increment();
          Provider.of<Counter>(context,listen: false).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//使用watch函数监听
class SecondPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<Customer>(context).name),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "${context.watch<Counter>().count}",
              style: TextStyle(fontSize: 30),
            ),
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
