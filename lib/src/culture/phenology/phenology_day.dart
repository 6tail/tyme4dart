import '../../abstract_culture_day.dart';
import 'phenology.dart';

/// 七十二候
///
/// Author: 6tail
class PhenologyDay extends AbstractCultureDay {
  PhenologyDay(Phenology super.culture, super.dayIndex);

  /// 候
  Phenology getPhenology() => culture as Phenology;
}
