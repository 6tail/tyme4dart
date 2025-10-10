import '../../abstract_culture_day.dart';
import 'nine.dart';

/// 数九天
///
/// author 6tail
class NineDay extends AbstractCultureDay {
  NineDay(Nine super.culture, super.dayIndex);

  /// 数九
  Nine getNine() => culture as Nine;
}
