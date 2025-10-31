import '../abstract_tyme.dart';
import '../culture/direction.dart';
import '../culture/star/nine/nine_star.dart';
import '../solar/solar_term.dart';
import 'sixty_cycle_day.dart';
import 'sixty_cycle_year.dart';
import 'sixty_cycle.dart';

/// 干支月
///
/// Author: 6tail
class SixtyCycleMonth extends AbstractTyme {
  /// 干支年
  final SixtyCycleYear year;

  /// 月柱
  final SixtyCycle month;

  SixtyCycleMonth(this.year, this.month);

  static SixtyCycleMonth fromIndex(int year, int index) {
    return SixtyCycleYear.fromYear(year).getFirstMonth().next(index);
  }

  /// 干支年
  SixtyCycleYear getSixtyCycleYear() => year;

  /// 年柱
  SixtyCycle getYear() => year.getSixtyCycle();

  /// 干支
  SixtyCycle getSixtyCycle() => month;

  @override
  String getName() => '$month月';

  @override
  String toString() => '$year${getName()}';

  @override
  SixtyCycleMonth next(int n) {
    int y = (year.getYear() * 12 + getIndexInYear() + n) ~/ 12;
    return SixtyCycleMonth(SixtyCycleYear.fromYear(y), month.next(n));
  }

  /// 位于当年的索引(0-11)，寅月为0，依次类推
  int getIndexInYear() => month.getEarthBranch().next(-2).getIndex();

  /// 九星
  NineStar getNineStar() {
    int index = month.getEarthBranch().getIndex();
    if (index < 2) {
      index += 3;
    }
    return NineStar.fromIndex(27 - getYear().getEarthBranch().getIndex() % 3 * 3 - index);
  }

  /// 太岁方位
  Direction getJupiterDirection() {
    int n = [7, -1, 1, 3][month.getEarthBranch().next(-2).getIndex() % 4];
    return n == -1 ? month.getHeavenStem().getDirection() : Direction.fromIndex(n);
  }

  /// 首日（节令当天）
  SixtyCycleDay getFirstDay() => SixtyCycleDay.fromSolarDay(SolarTerm(year.getYear(), 3 + getIndexInYear() * 2).getSolarDay());

  /// 本月的干支日列表
  List<SixtyCycleDay> getDays() {
    List<SixtyCycleDay> l = [];
    SixtyCycleDay d = getFirstDay();
    while (d.getSixtyCycleMonth() == this) {
      l.add(d);
      d = d.next(1);
    }
    return l;
  }
}
