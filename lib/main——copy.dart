import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:ota_update/ota_update.dart';

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
            TextButton(onPressed: _updateVersion, child: Text('版本升级124443')),
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
