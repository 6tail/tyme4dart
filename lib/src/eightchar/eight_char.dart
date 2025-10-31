import '../abstract_culture.dart';
import '../sixtycycle/earth_branch.dart';
import '../sixtycycle/heaven_stem.dart';
import '../sixtycycle/sixty_cycle.dart';
import '../sixtycycle/three_pillars.dart';
import '../solar/solar_term.dart';
import '../solar/solar_time.dart';

/// 八字
///
/// Author: 6tail
class EightChar extends AbstractCulture {
  /// 三柱
  late final ThreePillars threePillars;

  /// 时柱
  final SixtyCycle hour;

  EightChar(SixtyCycle year, SixtyCycle month, SixtyCycle day, this.hour) : threePillars = ThreePillars(year, month, day);

  EightChar.fromName(String yearName, String monthName, String dayName, String hourName) : threePillars = ThreePillars(SixtyCycle.fromName(yearName), SixtyCycle.fromName(monthName), SixtyCycle.fromName(dayName)), hour = SixtyCycle.fromName(hourName);

  /// 年柱
  SixtyCycle getYear() => threePillars.getYear();

  /// 月柱
  SixtyCycle getMonth() => threePillars.getMonth();

  /// 日柱
  SixtyCycle getDay() => threePillars.getDay();

  /// 时柱
  SixtyCycle getHour() => hour;

  /// 胎元
  SixtyCycle getFetalOrigin() {
    SixtyCycle m = getMonth();
    return SixtyCycle.fromName(m.getHeavenStem().next(1).getName() + m.getEarthBranch().next(3).getName());
  }

  /// 胎息
  SixtyCycle getFetalBreath() {
    SixtyCycle d = getDay();
    return SixtyCycle.fromName(d.getHeavenStem().next(5).getName() + EarthBranch.fromIndex(13 - d.getEarthBranch().getIndex()).getName());
  }

  /// 命宫
  SixtyCycle getOwnSign() {
    int m = getMonth().getEarthBranch().getIndex() - 1;
    if (m < 1) {
      m += 12;
    }
    int h = hour.getEarthBranch().getIndex() - 1;
    if (h < 1) {
      h += 12;
    }
    int offset = m + h;
    offset = (offset >= 14 ? 26 : 14) - offset;
    return SixtyCycle.fromName(HeavenStem.fromIndex((getYear().getHeavenStem().getIndex() + 1) * 2 + offset - 1).getName() + EarthBranch.fromIndex(offset + 1).getName());
  }

  /// 身宫
  SixtyCycle getBodySign() {
    int offset = getMonth().getEarthBranch().getIndex() - 1;
    if (offset < 1) {
      offset += 12;
    }
    offset += hour.getEarthBranch().getIndex() + 1;
    if (offset > 12) {
      offset -= 12;
    }
    return SixtyCycle.fromName(HeavenStem.fromIndex((getYear().getHeavenStem().getIndex() + 1) * 2 + offset - 1).getName() + EarthBranch.fromIndex(offset + 1).getName());
  }

  /// [startYear]开始年(含)到[endYear]结束年(含)公历时刻列表，支持1-9999年
  List<SolarTime> getSolarTimes(int startYear, int endYear) {
    List<SolarTime> l = [];
    SixtyCycle year = getYear();
    SixtyCycle month = getMonth();
    SixtyCycle day = getDay();
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
    // 时辰地支转时刻
    int h = hour.getEarthBranch().getIndex() * 2;
    // 兼容子时多流派
    List<int> hours = h == 0 ? [0, 23] : [h];
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
      SolarTime solarTime = term.getJulianDay().getSolarTime();
      if (solarTime.getYear() >= startYear) {
        // 日干支和节令干支的偏移值
        var solarDay = solarTime.getSolarDay();
        int d = day.next(-solarDay.getLunarDay().getSixtyCycle().getIndex()).getIndex();
        if (d > 0) {
          // 从节令推移天数
          solarDay = solarDay.next(d);
        }
        for (int hour in hours) {
          int mi = 0;
          int s = 0;
          // 如果正好是节令当天，且小时和节令的小时数相等的极端情况，把分钟和秒钟带上
          if (d == 0 && hour == solarTime.getHour()) {
            mi = solarTime.getMinute();
            s = solarTime.getSecond();
          }
          SolarTime time = SolarTime.fromYmdHms(solarDay.getYear(), solarDay.getMonth(), solarDay.getDay(), hour, mi, s);
          if (d == 30) {
            time = time.next(-3600);
          }
          // 验证一下
          if (time.getLunarHour().getEightChar() == this) {
            l.add(time);
          }
        }
      }
      y += 60;
    }
    return l;
  }

  @override
  String getName() => '$threePillars $hour';
}
