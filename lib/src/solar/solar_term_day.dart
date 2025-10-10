import '../abstract_culture_day.dart';
import 'solar_term.dart';

/// 节气第几天
///
/// Author: 6tail
class SolarTermDay extends AbstractCultureDay {
  SolarTermDay(SolarTerm super.culture, super.dayIndex);

  /// 节气
  SolarTerm getSolarTerm() => culture as SolarTerm;
}
