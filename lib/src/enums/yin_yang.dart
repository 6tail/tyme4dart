/// 阴阳
///
/// Author: 6tail
enum YinYang {
  /// 阴
  YIN(0, '阴'),

  /// 阳
  YANG(1, '阳');

  /// 代码
  final int code;

  /// 名称
  final String name;

  const YinYang(this.code, this.name);

  /// 从代码获取枚举
  static YinYang? fromCode(int code) {
    for (var item in YinYang.values) {
      if (item.code == code) {
        return item;
      }
    }
    return null;
  }

  /// 从名称获取枚举
  static YinYang? fromName(String name) {
    for (var item in YinYang.values) {
      if (item.name == name) {
        return item;
      }
    }
    return null;
  }

  String getName() => name;

  int getCode() => code;

  @override
  String toString() => name;
}
