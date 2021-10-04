/*
 * @Author: MarioGo
 * @Date: 2021-10-02 20:58:53
 * @LastEditTime: 2021-10-03 22:18:53
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/demo/qqSideslip.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

class QQSideslipPage extends StatefulWidget {
  const QQSideslipPage({Key? key}) : super(key: key);

  @override
  _QQSideslipPageState createState() => _QQSideslipPageState();
}

class _QQSideslipPageState extends State<QQSideslipPage> {
  List list = List.generate(20, (index) => index);

  late SwipeActionController controller;

  @override
  void initState() {
    super.initState();
    //获取事件
    controller = SwipeActionController(selectedIndexPathsChangeCallback:
        (changedIndexPaths, selected, currentCount) {
      print(
          'cell at ${changedIndexPaths.toString()} is/are ${selected ? 'selected' : 'unselected'} ,current selected count is $currentCount');

      //在本例中，我只是调用setState()进行更新。
      // /但是整个页面将被重建。
      // /所以你在开发的时候，最好更新一下。
      // /UI子树的最佳性能....

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CupertinoButton.filled(
          child: Text(controller.isEditing ? "取消" : "编辑"),
          onPressed: () {
            controller.toggleEditingMode();
            setState(() {});
          }),
      appBar: CupertinoNavigationBar(
        middle: Text(
          "测试",
          style: TextStyle(fontSize: 24),
        ),
        trailing: CupertinoButton.filled(
            child: Text("获取要删除的序列"),
            onPressed: () {
              print(controller.getSelectedIndexPaths().toString());
            }),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _item(index);
        },
      ),
    );
  }

  Widget _item(int index) {
    return SwipeActionCell(
        controller: controller,
        index: index,
        key: ValueKey(list[index]),
        normalAnimationDuration: 500,
        deleteAnimationDuration: 400,
        performsFirstActionWithFullSwipe: true,
        trailingActions: [
          SwipeAction(
              title: "删除",
              nestedAction: SwipeNestedAction(title: "确认删除"),
              onTap: (handler) async {
                //点击事件
                await handler(true);
                list.removeAt(index);
                setState(() {});
              }),
          SwipeAction(
              title: "置顶",
              color: Colors.grey,
              onTap: (handler) {
                handler(false);
              }),
        ],
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text("this is index of ${list[index]}",
              style: TextStyle(fontSize: 20)),
        ));
  }
}
