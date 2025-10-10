import '../../abstract_culture_day.dart';
import 'dog.dart';

/// 三伏天
///
/// Author: 6tail
class DogDay extends AbstractCultureDay {
  DogDay(Dog super.culture, super.dayIndex);

  /// 三伏
  Dog getDog() => culture as Dog;
}
