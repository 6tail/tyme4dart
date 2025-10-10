import '../abstract_tyme.dart';
import '../culture/direction.dart';
import '../culture/duty.dart';
import '../culture/element.dart';
import '../culture/fetus/fetus_day.dart';
import '../culture/god.dart';
import '../culture/star/nine/nine_star.dart';
import '../culture/star/twelve/twelve_star.dart';
import '../culture/star/twentyeight/twenty_eight_star.dart';
import '../culture/taboo.dart';
import '../lunar/lunar_day.dart';
import '../lunar/lunar_month.dart';
import '../lunar/lunar_year.dart';
import '../solar/solar_day.dart';
import '../solar/solar_term.dart';
import '../solar/solar_time.dart';
import 'sixty_cycle.dart';
import 'sixty_cycle_hour.dart';
import 'sixty_cycle_month.dart';
import 'sixty_cycle_year.dart';

/// 干支日（立春换年，节令换月）
///
/// Author: 6tail
class SixtyCycleDay extends AbstractTyme {
  /// 公历日
  final SolarDay solarDay;

  /// 干支月
  final SixtyCycleMonth month;

  /// 日柱
  final SixtyCycle day;

  SixtyCycleDay(this.solarDay, this.month, this.day);

  static SixtyCycleDay fromSolarDay(SolarDay solarDay) {
    int solarYear = solarDay.getYear();
    SolarDay springSolarDay = SolarTerm(solarYear, 3).getJulianDay().getSolarDay();
    LunarDay lunarDay = solarDay.getLunarDay();
    LunarYear lunarYear = lunarDay.getLunarMonth().getLunarYear();
    if (lunarYear.getYear() == solarYear) {
      if (solarDay.isBefore(springSolarDay)) {
        lunarYear = lunarYear.next(-1);
      }
    } else if (lunarYear.getYear() < solarYear) {
      if (!solarDay.isBefore(springSolarDay)) {
        lunarYear = lunarYear.next(1);
      }
    }
    SolarTerm term = solarDay.getTerm();
    int index = term.getIndex() - 3;
    if (index < 0 && term.getJulianDay().getSolarDay().isAfter(springSolarDay)) {
      index += 24;
    }
    return SixtyCycleDay(solarDay, SixtyCycleMonth(SixtyCycleYear(lunarYear.getYear()), LunarMonth(solarYear, 1).getSixtyCycle().next((index * 0.5).floor())), lunarDay.getSixtyCycle());
  }

  /// 公历日
  SolarDay getSolarDay() => solarDay;

  /// 干支月
  SixtyCycleMonth getSixtyCycleMonth() => month;

  /// 年柱
  SixtyCycle getYear() => month.getYear();

  /// 月柱
  SixtyCycle getMonth() => month.getSixtyCycle();

  /// 干支
  SixtyCycle getSixtyCycle() => day;

  @override
  String getName() => '$day日';

  @override
  String toString() => '$month${getName()}';

  /// 建除十二值神
  Duty getDuty() => Duty(day.getEarthBranch().getIndex() - getMonth().getEarthBranch().getIndex());

  /// 黄道黑道十二神
  TwelveStar getTwelveStar() => TwelveStar(day.getEarthBranch().getIndex() + (8 - getMonth().getEarthBranch().getIndex() % 6) * 2);

  /// 九星
  NineStar getNineStar() {
    SolarTerm dongZhi = SolarTerm.fromIndex(solarDay.getYear(), 0);
    SolarDay dongZhiSolar = dongZhi.getJulianDay().getSolarDay();
    SolarDay xiaZhiSolar = dongZhi.next(12).getJulianDay().getSolarDay();
    SolarDay dongZhiSolar2 = dongZhi.next(24).getJulianDay().getSolarDay();
    int dongZhiIndex = dongZhiSolar.getLunarDay().getSixtyCycle().getIndex();
    int xiaZhiIndex = xiaZhiSolar.getLunarDay().getSixtyCycle().getIndex();
    int dongZhiIndex2 = dongZhiSolar2.getLunarDay().getSixtyCycle().getIndex();
    SolarDay solarShunBai = dongZhiSolar.next(dongZhiIndex > 29 ? 60 - dongZhiIndex : -dongZhiIndex);
    SolarDay solarShunBai2 = dongZhiSolar2.next(dongZhiIndex2 > 29 ? 60 - dongZhiIndex2 : -dongZhiIndex2);
    SolarDay solarNiZi = xiaZhiSolar.next(xiaZhiIndex > 29 ? 60 - xiaZhiIndex : -xiaZhiIndex);
    int offset = 0;
    if (!solarDay.isBefore(solarShunBai) && solarDay.isBefore(solarNiZi)) {
      offset = solarDay.subtract(solarShunBai);
    } else if (!solarDay.isBefore(solarNiZi) && solarDay.isBefore(solarShunBai2)) {
      offset = 8 - solarDay.subtract(solarNiZi);
    } else if (!solarDay.isBefore(solarShunBai2)) {
      offset = solarDay.subtract(solarShunBai2);
    } else if (solarDay.isBefore(solarShunBai)) {
      offset = 8 + solarShunBai.subtract(solarDay);
    }
    return NineStar.fromIndex(offset);
  }

  /// 太岁方位
  Direction getJupiterDirection() {
    int index = day.getIndex();
    return index % 12 < 6 ? Element.fromIndex(index ~/ 12).getDirection() : month.getSixtyCycleYear().getJupiterDirection();
  }

  /// 逐日胎神
  FetusDay getFetusDay() => FetusDay.fromSixtyCycleDay(this);

  /// 二十八宿
  TwentyEightStar getTwentyEightStar() => TwentyEightStar([10, 18, 26, 6, 14, 22, 2][solarDay.getWeek().getIndex()]).next(-7 * day.getEarthBranch().getIndex());

  /// 神煞列表(吉神宜趋，凶神宜忌)
  List<God> getGods() => God.getDayGods(getMonth(), day);

  /// 宜
  List<Taboo> getRecommends() => Taboo.getDayRecommends(getMonth(), day);

  /// 忌
  List<Taboo> getAvoids() => Taboo.getDayAvoids(getMonth(), day);

  @override
  SixtyCycleDay next(int n) => SixtyCycleDay.fromSolarDay(solarDay.next(n));

  /// 干支时辰列表
  List<SixtyCycleHour> getHours() {
    List<SixtyCycleHour> l = [];
    SolarDay d = solarDay.next(-1);
    SixtyCycleHour h = SixtyCycleHour.fromSolarTime(SolarTime.fromYmdHms(d.getYear(), d.getMonth(), d.getDay(), 23, 0, 0));
    l.add(h);
    for (int i = 0; i < 11; i++) {
      h = h.next(7200);
      l.add(h);
    }
    return l;
  }
}
