/// 节日类型
///
/// Author: 6tail
enum FestivalType {
  /// 日期
  DAY(0, '日期'),

  /// 节气
  TERM(1, '节气'),

  /// 除夕
  EVE(2, '除夕');

  /// 代码
  final int code;

  /// 名称
  final String name;

  const FestivalType(this.code, this.name);

  /// 从代码获取枚举
  static FestivalType? fromCode(int code) {
    for (var item in FestivalType.values) {
      if (item.code == code) {
        return item;
      }
    }
    return null;
  }

  /// 从名称获取枚举
  static FestivalType? fromName(String name) {
    for (var item in FestivalType.values) {
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
