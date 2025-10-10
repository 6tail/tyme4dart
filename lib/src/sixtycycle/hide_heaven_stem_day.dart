import '../abstract_culture_day.dart';
import 'heaven_stem.dart';
import 'hide_heaven_stem.dart';

/// 人元司令分野（地支藏干+天索引）
///
/// Author: 6tail
class HideHeavenStemDay extends AbstractCultureDay {
  HideHeavenStemDay(HideHeavenStem super.culture, super.dayIndex);

  /// 获取藏干
  HideHeavenStem getHideHeavenStem() => culture as HideHeavenStem;

  @override
  String getName() {
    HeavenStem heavenStem = getHideHeavenStem().getHeavenStem();
    return heavenStem.getName() + heavenStem.getElement().getName();
  }

  @override
  String toString() => '${getName()}第${dayIndex + 1}天';
}
