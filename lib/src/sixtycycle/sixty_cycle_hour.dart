import '../abstract_tyme.dart';
import '../culture/star/nine/nine_star.dart';
import '../culture/star/twelve/twelve_star.dart';
import '../culture/taboo.dart';
import '../eightchar/eight_char.dart';
import '../lunar/lunar_day.dart';
import '../lunar/lunar_hour.dart';
import '../lunar/lunar_month.dart';
import '../lunar/lunar_year.dart';
import '../solar/solar_day.dart';
import '../solar/solar_term.dart';
import '../solar/solar_time.dart';
import 'sixty_cycle.dart';
import 'sixty_cycle_day.dart';
import 'sixty_cycle_month.dart';
import 'sixty_cycle_year.dart';

/// 干支时辰（立春换年，节令换月，23点换日）
///
/// Author: 6tail
class SixtyCycleHour extends AbstractTyme {
  /// 公历时刻
  final SolarTime solarTime;

  /// 干支日
  final SixtyCycleDay day;

  /// 时柱
  final SixtyCycle hour;

  SixtyCycleHour(this.solarTime, this.day, this.hour);

  static SixtyCycleHour fromSolarTime(SolarTime solarTime) {
    int solarYear = solarTime.getYear();
    SolarTime springSolarTime = SolarTerm(solarYear, 3).getJulianDay().getSolarTime();
    LunarHour lunarHour = solarTime.getLunarHour();
    LunarDay lunarDay = lunarHour.getLunarDay();
    LunarYear lunarYear = lunarDay.getLunarMonth().getLunarYear();
    if (lunarYear.getYear() == solarYear) {
      if (solarTime.isBefore(springSolarTime)) {
        lunarYear = lunarYear.next(-1);
      }
    } else if (lunarYear.getYear() < solarYear) {
      if (!solarTime.isBefore(springSolarTime)) {
        lunarYear = lunarYear.next(1);
      }
    }

    SolarTerm term = solarTime.getTerm();
    int index = term.getIndex() - 3;
    if (index < 0 && term.getJulianDay().getSolarTime().isAfter(SolarTerm(solarYear, 3).getJulianDay().getSolarTime())) {
      index += 24;
    }
    SixtyCycle d = lunarDay.getSixtyCycle();
    return SixtyCycleHour(solarTime, SixtyCycleDay(solarTime.getSolarDay(), SixtyCycleMonth(SixtyCycleYear(lunarYear.getYear()), LunarMonth(solarYear, 1).getSixtyCycle().next((index * 0.5).floor())), solarTime.getHour() < 23 ? d : d.next(1)), lunarHour.getSixtyCycle());
  }

  SixtyCycle getYear() => day.getYear();

  SixtyCycle getMonth() => day.getMonth();

  SixtyCycle getDay() => day.getSixtyCycle();

  SixtyCycle getSixtyCycle() => hour;

  SixtyCycleDay getSixtyCycleDay() => day;

  SolarTime getSolarTime() => solarTime;

  @override
  String getName() => '$hour时';

  @override
  String toString() => '$day${getName()}';

  int getIndexInDay() {
    int h = solarTime.getHour();
    return h == 23 ? 0 : ((h + 1) / 2).floor();
  }

  NineStar getNineStar() {
    SolarDay solar = solarTime.getSolarDay();
    SolarTerm dongZhi = SolarTerm(solar.getYear(), 0);
    int earthBranchIndex = getIndexInDay() % 12;
    int index = [8, 5, 2][getDay().getEarthBranch().getIndex() % 3];
    if (!solar.isBefore(dongZhi.getJulianDay().getSolarDay()) && solar.isBefore(dongZhi.next(12).getJulianDay().getSolarDay())) {
      index = 8 + earthBranchIndex - index;
    } else {
      index -= earthBranchIndex;
    }
    return NineStar(index);
  }

  TwelveStar getTwelveStar() => TwelveStar(hour.getEarthBranch().getIndex() + (8 - getDay().getEarthBranch().getIndex() % 6) * 2);

  List<Taboo> getRecommends() => Taboo.getHourRecommends(getDay(), hour);

  List<Taboo> getAvoids() => Taboo.getHourAvoids(getDay(), hour);

  @override
  SixtyCycleHour next(int n) => fromSolarTime(solarTime.next(n));

  /// 八字
  EightChar getEightChar() => EightChar(getYear(), getMonth(), getDay(), hour);
}
