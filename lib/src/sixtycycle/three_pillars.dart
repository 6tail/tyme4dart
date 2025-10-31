import '../abstract_culture.dart';
import '../sixtycycle/heaven_stem.dart';
import '../sixtycycle/sixty_cycle.dart';
import '../solar/solar_term.dart';
import '../solar/solar_day.dart';

/// 三柱
///
/// Author: 6tail
class ThreePillars extends AbstractCulture {
  /// 年柱
  final SixtyCycle year;

  /// 月柱
  final SixtyCycle month;

  /// 日柱
  final SixtyCycle day;

  ThreePillars(this.year, this.month, this.day);

  ThreePillars.fromName(String yearName, String monthName, String dayName)
      : year = SixtyCycle.fromName(yearName),
        month = SixtyCycle.fromName(monthName),
        day = SixtyCycle.fromName(dayName);

  /// 年柱
  SixtyCycle getYear() => year;

  /// 月柱
  SixtyCycle getMonth() => month;

  /// 日柱
  SixtyCycle getDay() => day;

  /// [startYear]开始年(含)到[endYear]结束年(含)公历日列表，支持1-9999年
  List<SolarDay> getSolarDays(int startYear, int endYear) {
    List<SolarDay> l = [];
    // 月地支距寅月的偏移值
    int m = month.getEarthBranch().next(-2).getIndex();
    // 月天干要一致
    if (HeavenStem.fromIndex((year.getHeavenStem().getIndex() + 1) * 2 + m) != month.getHeavenStem()) {
      return l;
    }
    // 1年的立春是辛酉，序号57
    int y = year.next(-57).getIndex() + 1;
    // 节令偏移值
    m *= 2;
    int baseYear = startYear - 1;
    if (baseYear > y) {
      y += 60 * (((baseYear - y) / 60.0).ceil());
    }
    while (y <= endYear) {
      // 立春为寅月的开始
      SolarTerm term = SolarTerm.fromIndex(y, 3);
      // 节令推移，年干支和月干支就都匹配上了
      if (m > 0) {
        term = term.next(m);
      }
      SolarDay solarDay = term.getSolarDay();
      if (solarDay.getYear() >= startYear) {
        // 日干支和节令干支的偏移值
        int d = day.next(-solarDay.getLunarDay().getSixtyCycle().getIndex()).getIndex();
        if (d > 0) {
          // 从节令推移天数
          solarDay = solarDay.next(d);
        }
        // 验证一下
        if (solarDay.getSixtyCycleDay().getThreePillars() == this) {
          l.add(solarDay);
        }
      }
      y += 60;
    }
    return l;
  }

  @override
  String getName() => '$year $month $day';
}
