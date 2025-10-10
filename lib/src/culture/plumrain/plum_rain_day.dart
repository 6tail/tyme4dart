import '../../abstract_culture_day.dart';
import 'plum_rain.dart';

/// 梅雨天
///
/// Author: 6tail
class PlumRainDay extends AbstractCultureDay {
  PlumRainDay(PlumRain super.culture, super.dayIndex);

  /// 梅雨
  PlumRain getPlumRain() => culture as PlumRain;

  @override
  String toString() => getPlumRain().getIndex() == 0 ? super.toString() : culture.getName();
}
