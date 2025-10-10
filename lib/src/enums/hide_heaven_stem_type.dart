/// 藏干类型
///
/// Author: 6tail
enum HideHeavenStemType {
  /// 余气
  RESIDUAL(0, '余气'),

  /// 中气
  MIDDLE(1, '中气'),

  /// 本气
  MAIN(2, '本气');

  /// 代码
  final int code;

  /// 名称
  final String name;

  const HideHeavenStemType(this.code, this.name);

  /// 从代码获取枚举
  static HideHeavenStemType? fromCode(int code) {
    for (var item in HideHeavenStemType.values) {
      if (item.code == code) {
        return item;
      }
    }
    return null;
  }

  /// 从名称获取枚举
  static HideHeavenStemType? fromName(String name) {
    for (var item in HideHeavenStemType.values) {
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
