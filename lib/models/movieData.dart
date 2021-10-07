/*
 * @Author: MarioGo
 * @Date: 2021-10-07 19:48:08
 * @LastEditTime: 2021-10-07 19:48:08
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/models/movieData.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */

class Movie {
  /// 名称
  final String name;

  /// 简介
  final String intro;

  /// 海报图片
  final String poster;

  /// 上映日期
  final String date;

  /// 票价
  final String price;

  const Movie({
    required this.name,
    required this.intro,
    required this.poster,
    required this.date,
    required this.price,
  });
}
