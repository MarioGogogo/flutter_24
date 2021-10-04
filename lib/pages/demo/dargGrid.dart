/*
 * @Author: MarioGo
 * @Date: 2021-10-03 22:13:39
 * @LastEditTime: 2021-10-04 19:10:39
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/demo/dargGrid.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */

import 'package:flutter/material.dart';

class DragAbleGridViewDemo extends StatefulWidget {
  DragAbleGridViewDemo({Key? key}) : super(key: key);
  final List _dataList = <String>[
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
  ].toList();
  @override
  _DragAbleGridViewDemoState createState() => _DragAbleGridViewDemoState();
}

class _DragAbleGridViewDemoState extends State<DragAbleGridViewDemo> {
  List? _dataListBackup;
  int _willAcceptIndex = -1;
  // ignore: unused_field
  bool _showItemWhenCovered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DragAbleGrid"),
      ),
      body: GridView.count(
        childAspectRatio: 3.0,
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        children: _buildGridChildren(context),
      ),
    );
  }

  //生成widget列表
  List<Widget> _buildGridChildren(BuildContext context) {
    List<Widget> _item = List<Widget>.generate(
        widget._dataList.length, (it) => (_buildItemWidget(context, it)));

    return _item;
  }

  Widget _buildItemWidget(BuildContext context, int index) {
    return LongPressDraggable(
      data: index,
      child: DragTarget<int>(
        onAccept: (data) {
          setState(() {
            final temp = widget._dataList[data];
            widget._dataList.remove(temp);
            widget._dataList.insert(index, temp);
          });
        },
        builder: (context, data, rejects) {
          return Card(
            child: Center(
              child: Text('x = ${widget._dataList[index]}'),
            ),
          );
        },
        onLeave: (data) {
          print('$data is Leaving item $index');
        },
        onWillAccept: (data) {
          // bug:这里有bug】
          // print('目前移动到点是 $index 起点是 $fromIndex');
          // final accept = fromIndex != index;
          // if(accept){
          //    _willAcceptIndex = index;
          //    _showItemWhenCovered = true;
          //    widget._dataList = _dataListBackup.sublist(0);
          //    final fromData = widget._dataList[fromIndex];
          //    setState(() {
          //      widget._dataList.removeAt(fromIndex);
          //      //再删除的地方插入
          //      widget._dataList.insert(index, fromData);
          //    });
          // }
          return true;
        },
      ),
      onDragStarted: () {
        //开始拖动，备份数据源
        print('开始拖动，备份数据源 $index ---------------------------onDragStarted');
      },
      onDraggableCanceled: (Velocity velocity, Offset offset) {
        print(
            '拖动取消，还原数据源 $index ---------------------------onDraggableCanceled,velocity = $velocity,offset = $offset');
        //拖动取消，还原数据源
      },
      onDragCompleted: () {
        //拖动完成，刷新状态，重置willAcceptIndex
        print(
            "拖动完成，刷新状态，重置willAcceptIndex $index ---------------------------onDragCompleted");
        _dataListBackup = widget._dataList.sublist(0);
      },
      //用户拖动item时，那个给用户看起来被拖动的widget，（就是会跟着用户走的那个widget）
      feedback: Card(
        child: Center(
          child: Text('x = ${widget._dataList[index]}'),
        ),
      ),
      childWhenDragging: Container(
        child: SizedBox(
          child: null,
        ),
      ),
    );
  }
}
