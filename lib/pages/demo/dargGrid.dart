import 'package:flutter/material.dart';
import 'package:flutter_24/components/DraggableGridView.dart';

class DraggableGridViewPage extends StatelessWidget {
  final List<String> channelItems = [];
  final bool showDeleteIcon = false;
  DraggableGridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    for (int x = 0; x < 10; x++) {
      channelItems.add("x = $x");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("DraggableGridViewDemo"),
      ),
      body: SortableGridView(
        channelItems,
        childAspectRatio: 3.0, //宽高3比1
        crossAxisCount: 3, //3列
        scrollDirection: Axis.vertical, //竖向滑动
        canAccept: (oldIndex, newIndex) {
          return true;
        },
        itemBuilder: (context, data) {
          return Card(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Center(
              child: Text("$data"),
            ),
          ));
        },
      ),
    );
  }
}
