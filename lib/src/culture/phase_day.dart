import '../abstract_culture_day.dart';
import 'phase.dart';

/// 月相第几天
///
/// Author: 6tail
class PhaseDay extends AbstractCultureDay {

  PhaseDay(Phase super.culture, super.dayIndex);

  /// 月相
  Phase getPhase() => culture as Phase;
}
