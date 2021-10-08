/*
 * @Author: MarioGo

import 'package:flutter_24/models/movieData.dart';
 * @Date: 2021-10-07 19:58:59
 * @LastEditTime: 2021-10-08 10:26:54
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/components/sliding_card.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_24/models/movieData.dart';

class SlidingCard extends StatelessWidget {
  /// 动画过程偏移量
  final double offset;

  /// 电影模型
  final Movie movie;

  SlidingCard({
    Key? key,
    required this.movie,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
              child: Image.asset(
                '${movie.poster}',
                height: MediaQuery.of(context).size.height * 0.3,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${movie.name}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(height: 8),
                    Text('上映日期: ${movie.date}',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    Text(
                      '${movie.intro}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Spacer(),
                    Row(
                      children: <Widget>[
                        ElevatedButton(
                          child: Text('立即购买'),
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(32),
                          // ),
                          onPressed: () {
                            //这里测试 snackbar
                            //新api
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.blue,
                              content: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.check,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '购买成功了',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              duration: const Duration(seconds: 3),
                              action: SnackBarAction(
                                textColor: Colors.white,
                                label: '知道了',
                                onPressed: () {},
                              ),
                            ));

                            //旧api
                            // Scaffold.of(context).showSnackBar(SnackBar(
                            // content: Row(
                            //   children: <Widget>[
                            //     Icon(
                            //       Icons.check,
                            //       color: Colors.green,
                            //     ),
                            //     Text('下载成功')
                            //   ],
                            // ),
                            //   action: SnackBarAction(
                            //     label: '知道了',
                            //     onPressed: () {},
                            //   ),
                            // ));
                          },
                        ),
                        Spacer(),
                        Text(
                          '￥${movie.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 16),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
