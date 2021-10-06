import 'package:flutter/material.dart';

class DraggablePage extends StatefulWidget {
  @override
  _DraggablePageState createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  List<String> _items1 = List<String>.generate(11, (it) => 'item $it');
  List<String> _items2 = List<String>.generate(10, (it) => 'item $it');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('仿支付宝功能模块'),
      ),
      body: Column(
        children: <Widget>[
          DragTarget<String>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return _createGridView(_items1);
            },
            onLeave: (data) {
              print("onLeave,$data");
            },
            onMove: (data) {
              print("onMove,$data");
            },
            onAccept: (String data) {
              print(data);
              print(_items1);
              setState(() {
                _items1.add(data);
              });
            },
          ),
          SizedBox(
            height: 100,
          ),
          DragTarget<String>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return _createGridView(_items2);
            },
            onAccept: (String data) {
              setState(() {
                _items2.add(data);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _createGridView(List<String> _items) {
    return GridView.builder(
      itemCount: _items.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Draggable<String>(
          onDragCompleted: () {
            // 在拖动结束后删除数据
            print("在拖动结束后删除数据,$index");
            setState(() {
              _items.removeAt(index);
            });
          },
          childWhenDragging: Container(
            color: Colors.blueAccent,
            alignment: Alignment.center,
            foregroundDecoration: BoxDecoration(color: Colors.white30),
            child: Text(
              _items[index],
              style: TextStyle(color: Colors.white),
            ),
          ),
          feedback: Material(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: Text(
                _items[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          // 当前组件的数据
          data: _items[index],
          child: Container(
            color: Colors.blueAccent,
            alignment: Alignment.center,
            child: Text(
              _items[index],
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
