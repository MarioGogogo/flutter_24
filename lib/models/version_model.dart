/// version : "1.0.9"
/// mandatory : false
/// updateContent : ["1、修复了一些显示问题","2、新增搜索页面","3、项目管理可切换成员搜索","4、项目过期显示橙色"]
/// iosAddress : "https://apps.apple.com/cn/app/tasktodo/id1498326734"
/// androidAddress : "http://cloud.52react.cn/index.php?user/publicLink&fid=a162rhG9BzfBO3dbGgZILosi5HpI90v9DS_8JKSZjV8F094Trfdsb42MJFEDwXI-XRyckA08wbeTTCS1UiqDamuJo6TPNfBm1LrL0dkL-SXBY5xuXl2EgWwMuDcbaKvDhXdsFJrx&file_name=/flutter_24.apk"

class VersionModel {
  VersionModel({
      String? version, 
      bool? mandatory, 
      List<String>? updateContent, 
      String? iosAddress, 
      String? androidAddress,}){
    _version = version;
    _mandatory = mandatory;
    _updateContent = updateContent;
    _iosAddress = iosAddress;
    _androidAddress = androidAddress;
}

  VersionModel.fromJson(dynamic json) {
    _version = json['version'];
    _mandatory = json['mandatory'];
    _updateContent = json['updateContent'] != null ? json['updateContent'].cast<String>() : [];
    _iosAddress = json['iosAddress'];
    _androidAddress = json['androidAddress'];
  }
  String? _version;
  bool? _mandatory;
  List<String>? _updateContent;
  String? _iosAddress;
  String? _androidAddress;

  String? get version => _version;
  bool? get mandatory => _mandatory;
  List<String>? get updateContent => _updateContent;
  String? get iosAddress => _iosAddress;
  String? get androidAddress => _androidAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['version'] = _version;
    map['mandatory'] = _mandatory;
    map['updateContent'] = _updateContent;
    map['iosAddress'] = _iosAddress;
    map['androidAddress'] = _androidAddress;
    return map;
  }

}