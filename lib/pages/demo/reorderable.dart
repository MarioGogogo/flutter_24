/*
 * @Author: MarioGo
 * @Date: 2021-10-04 19:12:10
 * @LastEditTime: 2021-10-04 20:02:32
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/demo/reorderable.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';

class ReorderablePage extends StatefulWidget {
  ReorderablePage({Key? key}) : super(key: key);

  @override
  _ReorderablePageState createState() => _ReorderablePageState();
}

class _ReorderablePageState extends State<ReorderablePage> {
  List<String> items = List.generate(20, (int i) => '$i');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("上下拖拽组件"),
      ),
      body: Container(
        child: ReorderableListView(
          // scrollDirection: Axis.horizontal,   //横向
          header: Center(
            child: Text(
              '一枚有态度的程序员',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
          children: [
            for (String item in items)
              Container(
                key: ValueKey(item),
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors
                        .primaries[int.parse(item) % Colors.primaries.length],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              )
          ],
          onReorder: (int oldIndex, int newIndex) {
            print("拖动结束 拖动元素$oldIndex ,目标元素$newIndex");
            //是拖动完成的回调
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            var child = items.removeAt(oldIndex);
            // items.insert(newIndex, child);
            setState(() {
              items.insert(newIndex, child);
            });
            print(items);
          },
        ),
      ),
    );
  }
}
