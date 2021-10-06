/*
 * @Author: MarioGo
 * @Date: 2021-10-05 23:40:54
 * @LastEditTime: 2021-10-06 00:09:55
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/demo/reorderableGridView.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class ReorderableGridViewPage extends StatefulWidget {
  ReorderableGridViewPage({Key? key}) : super(key: key);

  @override
  _ReorderableGridViewPageState createState() =>
      _ReorderableGridViewPageState();
}

class _ReorderableGridViewPageState extends State<ReorderableGridViewPage> {
  final data = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    Widget buildItem(String text) {
      return Stack(
        key: ValueKey(text),
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
              color: Colors.amber,
              child: Center(
                child: Text(text),
              )),
          Positioned(
              right: -20,
              top: -10,
              child: IconButton(
                onPressed: () {
                  //删除图片点击事件
                  print("删除图片");
                },
                icon: Icon(Icons.delete_forever_outlined),
                color: Colors.red,
              ))
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("微信相册排序/上传"),
      ),
      body: Center(
        child: ReorderableGridView(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: this.data.map((e) => buildItem("$e")).toList(),
          onReorder: (oldIndex, newIndex) {
            print("$oldIndex, $newIndex");
            setState(() {
              //删除旧值
              final element = data.removeAt(oldIndex);
              // 插入新值
              data.insert(newIndex, element);
            });
          },
          footer: [
            Card(
              child: Center(
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
