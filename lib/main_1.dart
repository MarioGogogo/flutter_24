import 'dart:convert';

import "package:dio/dio.dart" show Dio, Response;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ota_update/ota_update.dart';
import 'dart:io';
import 'models/version_model.dart';

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
      home: MyHomePage(title: 'Flutter应用内App版本更新'),
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
  String vInfo = '';
  String progress = '';

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter应用内App版本更新'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: _checkVersion, child: Text('版本升级124443')),
            Container(
              child: Text('$vInfo'),
            ),
            Container(
              child: Text('$progress'),
            ),
          ],
        ),
      ),
    );
  }

  void _initData() async {
    //获取当前版本号
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    setState(() {
      vInfo = Platform.isIOS ? 'iOS_$version' : 'android_$version';
    });
  }

  ///版本校验
  void _checkVersion() async {
    /// 获得服务器版本
    //这写上获取json的url，json格式按照定义的versionModel
    String url =
        'https://mock.apipost.cn/app/mock/project/cd28d8af-68b9-11eb-a95d-1c34da7b354c/api/updateApp';
    Response result = await Dio().get(url);

    Map<String, dynamic> map = json.decode(result.toString());
    VersionModel data = VersionModel.fromJson(map);

    print(data.version);

    if (data.version != null) {
      //获取服务器版本
      var serviceVersion = data.version;
      var serviceVersionName =
      Platform.isIOS ? 'iOS_$serviceVersion' : 'android_$serviceVersion';
      if (this.vInfo == serviceVersionName) {
        //验证通过
        // _goNextPage();
        print("验证通过，登录处理");
      } else {
        //版本不符弹出对话框
        print("跳出弹窗");
        this._showUpdateDialog(data);
      }
    } else {
      //获取版本失败 网络或者其他原因 退出App
      // ToastUtil.showToast('获取版本失败');
      print("失败了退出appp");
      // await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

  _showUpdateDialog(serviceVersion) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          // List<Widget> contentList = [];
          var style = TextStyle(
            fontSize: 15,
          );
          // contentList.addAll(serviceVersion.updateContent.map((item) {
          //   return Text(
          //     item,
          //     style: style,
          //   );
          // }).toList());

          // contentList.insert(
          //     0,
          //     Container(
          //       height: 0.4,
          //       color: Colors.black,
          //       margin: EdgeInsets.only(top: 5, bottom: 5),
          //     ));

          return CupertinoAlertDialog(
            title: Text('版本更新',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            content: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 0.4,
                      color: Colors.blue,
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                    ),
                    Text("更新了一些bugs1", style: style),
                    Text("更新了一些bugs2", style: style),
                    Text("更新了一些bugs3", style: style),
                    Text("更新了一些bugs4", style: style),
                  ]),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                textColor: Colors.grey,
                onPressed: () => Navigator.of(context).pop(), // 关闭对话框
              ),
              FlatButton(
                child: Text('更新'),
                textColor: Colors.blue,
                onPressed: () async {
                  if (Platform.isAndroid) {
                    //安卓应用内下载
                    Navigator.pop(context);
                    this.tryOtaUpdate(serviceVersion);
                  } else {
                    //ios 跳转商店
                    if (await canLaunch(serviceVersion.iosAddress)) {
                      await launch(serviceVersion.iosAddress);
                    } else {
                      throw 'Could not launch ';
                    }
                  }
                },
              )
            ],
          );
        });
  }

  Future<void> tryOtaUpdate(serviceVersion) async {
    print(serviceVersion.androidAddress);
    try {
      // destinationFilename 是对下载的apk进行重命名
      OtaUpdate()
          .execute(serviceVersion.androidAddress,
          destinationFilename: 'news123.apk')
          .listen(
            (OtaEvent event) {
          print('status:${event.status},value:${event.value}');
          switch (event.status) {
            case OtaStatus.DOWNLOADING: // 下载中
              setState(() {
                progress = '下载进度:${event.value}%';
              });
              break;
            case OtaStatus.INSTALLING: //安装中
              break;
            case OtaStatus.PERMISSION_NOT_GRANTED_ERROR: // 权限错误
              print('更新失败，请稍后再试');
              break;
            default: // 其他问题
              break;
          }
        },
      );
    } catch (e) {
      print('更新失败，请稍后再试');
    }
  }

  void _updateVersion() async {
    //判断版本是否需要更新
    if (Platform.isIOS) {
      String url =
          'itms-apps://itunes.apple.com/cn/app/id414478124?mt=8'; // 这是微信的地址，到时候换成自己的应用的地址
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (Platform.isAndroid) {
      String url =
          'http://3g.163.com/links/4636'; // 网易新闻下载地址，地址可能失效，在测试时候可以先确认下下载地址是否是有效的
      try {
        // destinationFilename 是对下载的apk进行重命名
        OtaUpdate().execute(url, destinationFilename: 'news.apk').listen(
              (OtaEvent event) {
            print('status:${event.status},value:${event.value}');
            switch (event.status) {
              case OtaStatus.DOWNLOADING: // 下载中
                setState(() {
                  progress = '下载进度:${event.value}%';
                });
                break;
              case OtaStatus.INSTALLING: //安装中
                break;
              case OtaStatus.PERMISSION_NOT_GRANTED_ERROR: // 权限错误
                print('更新失败，请稍后再试');
                break;
              default: // 其他问题
                break;
            }
          },
        );
      } catch (e) {
        print('更新失败，请稍后再试');
      }
    }
  }
}
