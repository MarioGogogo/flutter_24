import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_24/components/UpdateAppDialog.dart';

import 'components/LoadingDialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dialog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _alertDialog() async {
    var res = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示信息"),
            content: Text("你确定删除吗？"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop("cacle"); // 关闭对话框
                  },
                  child: Text("取消")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop("ok");
                  },
                  child: Text("确定")),
            ],
          );
        });

    print(res);
  }

  _simpleDialog() async {
    var res = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("选中内容长大之后考"),
            children: [
              Divider(),
              SimpleDialogOption(
                child: Text("清华大学"),
                onPressed: () {
                  Navigator.pop(context, "清华大学");
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text("北京大学"),
                onPressed: () {
                  Navigator.of(context).pop("北京大学");
                },
              ),
              Divider(),
            ],
          );
        });
    print(res);
  }

  _modalBottomDialog() async {
    var res = await showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 200,
            child: Column(
              children: [
                ListTile(
                  title: Text("分享A"),
                  onTap: () {
                    Navigator.pop(context, "A");
                  },
                ),
                ListTile(
                  title: Text("分享B"),
                  onTap: () {
                    Navigator.pop(context, "B");
                  },
                ),
                ListTile(
                  title: Text("分享C"),
                  onTap: () {
                    Navigator.pop(context, "C");
                  },
                ),
              ],
            ),
          );
        });
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dialog'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("alert弹窗-alertDialog"),
                onPressed: _alertDialog,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("slect弹窗_simpleDialog"),
                onPressed: _simpleDialog,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("actionSheet底部弹窗-modalBottomDialog"),
                onPressed: _modalBottomDialog,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  child: Text("加载默认宽度弹窗-loadingDialog"),
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false, //点击 遮罩层不关闭
                        builder: (context) {
                          return LoadingDialog();
                        });
                  }),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("加载自定义宽度弹窗-loadingDialog"),
                onPressed: _modalBottomDialog,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  child: Text("新版本发布弹窗-updateAppDialog"),
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: true, //点击 遮罩层不关闭
                        builder: (context) {
                          return UpdateAppDialog();
                        });
                  }),
            ],
          ),
        ));
  }
}
