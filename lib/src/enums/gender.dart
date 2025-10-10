/// 性别
///
/// Author: 6tail
enum Gender {
  /// 女
  WOMAN(0, '女'),

  /// 男
  MAN(1, '男');

  /// 代码
  final int code;

  /// 名称
  final String name;

  const Gender(this.code, this.name);

  /// 从代码获取枚举
  static Gender? fromCode(int code) {
    for (var item in Gender.values) {
      if (item.code == code) {
        return item;
      }
    }
    return null;
  }

  /// 从名称获取枚举
  static Gender? fromName(String name) {
    for (var item in Gender.values) {
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
