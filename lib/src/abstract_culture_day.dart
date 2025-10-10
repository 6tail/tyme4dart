import 'abstract_culture.dart';
import 'culture.dart';

/// 带天索引的传统文化抽象
///
/// Author: 6tail
abstract class AbstractCultureDay extends AbstractCulture {
  /// 传统文化
  late final AbstractCulture culture;

  /// 天索引
  late final int dayIndex;

  AbstractCultureDay(this.culture, this.dayIndex);

  /// 天索引
  int getDayIndex() => dayIndex;

  Culture getCulture() => culture;

  @override
  String toString() => '$culture第${dayIndex + 1}天';

  @override
  String getName() => culture.getName();
}
