/// 内外
///
/// Author: 6tail
enum Side {
  /// 内
  IN(0, '内'),

  /// 外
  OUT(1, '外');

  /// 代码
  final int code;

  /// 名称
  final String name;

  const Side(this.code, this.name);

  /// 从代码获取枚举
  static Side? fromCode(int code) {
    for (var item in Side.values) {
      if (item.code == code) {
        return item;
      }
    }
    return null;
  }

  /// 从名称获取枚举
  static Side? fromName(String name) {
    for (var item in Side.values) {
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
