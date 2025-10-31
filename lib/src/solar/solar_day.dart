import '../abstract_tyme.dart';
import '../culture/constellation.dart';
import '../culture/dog/dog.dart';
import '../culture/dog/dog_day.dart';
import '../culture/nine/nine.dart';
import '../culture/nine/nine_day.dart';
import '../culture/phase.dart';
import '../culture/phase_day.dart';
import '../culture/phenology/phenology.dart';
import '../culture/phenology/phenology_day.dart';
import '../culture/plumrain/plum_rain.dart';
import '../culture/plumrain/plum_rain_day.dart';
import '../culture/week.dart';
import '../enums/hide_heaven_stem_type.dart';
import '../festival/solar_festival.dart';
import '../holiday/legal_holiday.dart';
import '../jd/julian_day.dart';
import '../lunar/lunar_day.dart';
import '../lunar/lunar_month.dart';
import '../rabbyung/rab_byung_day.dart';
import '../sixtycycle/hide_heaven_stem.dart';
import '../sixtycycle/hide_heaven_stem_day.dart';
import '../sixtycycle/sixty_cycle_day.dart';
import 'solar_month.dart';
import 'solar_term.dart';
import 'solar_term_day.dart';
import 'solar_week.dart';

/// 公历日
///
/// Author: 6tail
class SolarDay extends AbstractTyme {
  static const List<String> names = ['1日', '2日', '3日', '4日', '5日', '6日', '7日', '8日', '9日', '10日', '11日', '12日', '13日', '14日', '15日', '16日', '17日', '18日', '19日', '20日', '21日', '22日', '23日', '24日', '25日', '26日', '27日', '28日', '29日', '30日', '31日'];

  /// 公历月
  late final SolarMonth month;

  /// 日
  final int day;

  SolarDay(int year, int month, this.day) {
    if (day < 1) {
      throw ArgumentError('illegal solar day: $year-$month-$day');
    }
    SolarMonth m = SolarMonth.fromYm(year, month);
    if (1582 == year && 10 == month) {
      if ((day > 4 && day < 15) || day > 31) {
        throw ArgumentError('illegal solar day: $year-$month-$day');
      }
    } else if (day > m.getDayCount()) {
      throw ArgumentError('illegal solar day: $year-$month-$day');
    }
    this.month = m;
  }

  SolarDay.fromYmd(int year, int month, int day) : this(year, month, day);

  /// 公历月
  SolarMonth getSolarMonth() => month;

  /// 年
  int getYear() => month.getYear();

  /// 月
  int getMonth() => month.getMonth();

  /// 日
  int getDay() => day;

  /// 星期
  Week getWeek() => getJulianDay().getWeek();

  @override
  String getName() => names[day - 1];

  @override
  String toString() => '$month${getName()}';

  @override
  SolarDay next(int n) => getJulianDay().next(n).getSolarDay();

  /// 干支日
  SixtyCycleDay getSixtyCycleDay() => SixtyCycleDay.fromSolarDay(this);

  /// 星座
  Constellation getConstellation() {
    int y = getMonth() * 100 + day;
    return Constellation(y > 1221 || y < 120 ? 9 : y < 219 ? 10 : y < 321 ? 11 : y < 420 ? 0 : y < 521 ? 1 : y < 622 ? 2 : y < 723 ? 3 : y < 823 ? 4 : y < 923 ? 5 : y < 1024 ? 6 : y < 1123 ? 7 : 8);
  }

  /// 节气
  SolarTerm getTerm() => getTermDay().getSolarTerm();

  /// 节气第几天
  SolarTermDay getTermDay() {
    int y = getYear();
    int i = getMonth() * 2;
    if (i == 24) {
      y += 1;
      i = 0;
    }
    SolarTerm term = SolarTerm(y, i);
    SolarDay d = term.getSolarDay();
    while (isBefore(d)) {
      term = term.next(-1);
      d = term.getSolarDay();
    }
    return SolarTermDay(term, subtract(d));
  }

  /// 七十二候
  PhenologyDay getPhenologyDay() {
    SolarTermDay d = getTermDay();
    int dayIndex = d.getDayIndex();
    int index = dayIndex ~/ 5;
    if (index > 2) {
      index = 2;
    }
    SolarTerm term = d.getSolarTerm();
    return PhenologyDay(Phenology(term.getYear(), term.getIndex() * 3 + index), dayIndex - index * 5);
  }

  /// 候
  Phenology getPhenology() => getPhenologyDay().getPhenology();

  /// 是否在[target]指定公历日之前
  bool isBefore(SolarDay target) {
    int aYear = getYear();
    int bYear = target.getYear();
    if (aYear != bYear) {
      return aYear < bYear;
    }
    int aMonth = getMonth();
    int bMonth = target.getMonth();
    return aMonth != bMonth ? aMonth < bMonth : day < target.getDay();
  }

  /// 是否在[target]指定公历日之后
  bool isAfter(SolarDay target) {
    int aYear = getYear();
    int bYear = target.getYear();
    if (aYear != bYear) {
      return aYear > bYear;
    }
    int aMonth = getMonth();
    int bMonth = target.getMonth();
    return aMonth != bMonth ? aMonth > bMonth : day > target.getDay();
  }

  /// 以[start]为起始的公历周，1234560分别代表星期一至星期天
  SolarWeek getSolarWeek(int start) {
    int y = getYear();
    int m = getMonth();
    return SolarWeek(y, m, ((day + SolarDay(y, m, 1).getWeek().next(-start).getIndex()) / 7).ceil() - 1, start);
  }

  /// 与[target]指定公历日相减的天数
  int subtract(SolarDay target) => getJulianDay().subtract(target.getJulianDay()).toInt();

  /// 儒略日
  JulianDay getJulianDay() => JulianDay.fromYmdHms(getYear(), getMonth(), day, 0, 0, 0);

  /// 农历日
  LunarDay getLunarDay() {
    LunarMonth m = LunarMonth(getYear(), getMonth());
    int days = subtract(m.getFirstJulianDay().getSolarDay());
    while (days < 0) {
      m = m.next(-1);
      days += m.getDayCount();
    }
    return LunarDay(m.getYear(), m.getMonthWithLeap(), days + 1);
  }

  /// 公历现代节日（若无则返回 null）
  SolarFestival? getFestival() => SolarFestival.fromYmd(getYear(), getMonth(), day);

  /// 法定节假日（若无则返回 null）
  LegalHoliday? getLegalHoliday() => LegalHoliday.fromYmd(getYear(), getMonth(), day);

  /// 藏历日
  RabByungDay getRabByungDay() => RabByungDay.fromSolarDay(this);

  @override
  bool operator ==(Object other) {
    if (other is! SolarDay) return false;
    return getYear() == other.getYear() && getMonth() == other.getMonth() && day == other.day;
  }

  @override
  int get hashCode => Object.hash(getYear(), getMonth(), day);

  /// 获取月相第几天
  PhaseDay getPhaseDay() {
    LunarMonth lunarMonth = getLunarDay().month.next(1);
    Phase p = Phase(lunarMonth.year.getYear(), lunarMonth.getMonthWithLeap(), 0);
    SolarDay d = p.getSolarDay();
    while (d.isAfter(this)) {
      p = p.next(-1);
      d = p.getSolarDay();
    }
    return PhaseDay(p, subtract(d));
  }

  /// 月相
  Phase getPhase() => getPhaseDay().getPhase();

  /// 三伏天
  DogDay? getDogDay() {
    // 夏至
    SolarTerm xiaZhi = SolarTerm(getYear(), 12);
    SolarDay start = xiaZhi.getSolarDay();
    // 第3个庚日，即初伏第1天
    start = start.next(start.getLunarDay().getSixtyCycle().getHeavenStem().stepsTo(6) + 20);
    int days = subtract(start);
    // 初伏以前
    if (days < 0) {
      return null;
    }
    if (days < 10) {
      return DogDay(Dog(0), days);
    }
    // 第4个庚日，中伏第1天
    start = start.next(10);
    days = subtract(start);
    if (days < 10) {
      return DogDay(Dog(1), days);
    }
    // 第5个庚日，中伏第11天或末伏第1天
    start = start.next(10);
    days = subtract(start);
    // 立秋
    if (xiaZhi.next(3).getSolarDay().isAfter(start)) {
      if (days < 10) {
        return DogDay(Dog(1), days + 10);
      }
      start = start.next(10);
      days = subtract(start);
    }
    return days >= 10 ? null : DogDay(Dog(2), days);
  }

  /// 数九天
  NineDay? getNineDay() {
    int year = getYear();
    SolarDay start = SolarTerm(year + 1, 0).getSolarDay();
    if (isBefore(start)) {
      start = SolarTerm(year, 0).getSolarDay();
    }
    SolarDay end = start.next(81);
    if (isBefore(start) || !isBefore(end)) {
      return null;
    }
    int days = subtract(start);
    return NineDay(Nine(days ~/ 9), days % 9);
  }

  /// 梅雨天（芒种后的第1个丙日入梅，小暑后的第1个未日出梅）
  PlumRainDay? getPlumRainDay() {
    // 芒种
    SolarTerm grainInEar = SolarTerm(getYear(), 11);
    SolarDay start = grainInEar.getSolarDay();
    // 芒种后的第1个丙日
    start = start.next(start.getLunarDay().getSixtyCycle().getHeavenStem().stepsTo(2));

    // 小暑
    SolarDay end = grainInEar.next(2).getSolarDay();
    // 小暑后的第1个未日
    end = end.next(end.getLunarDay().getSixtyCycle().getEarthBranch().stepsTo(7));

    if (isBefore(start) || isAfter(end)) {
      return null;
    }
    return this == end ? PlumRainDay(PlumRain(1), 0) : PlumRainDay(PlumRain(0), subtract(start));
  }

  /// 位于当年的索引
  int getIndexInYear() => subtract(SolarDay(getYear(), 1, 1));

  /// 人元司令分野
  HideHeavenStemDay getHideHeavenStemDay() {
    List<int> dayCounts = [3, 5, 7, 9, 10, 30];
    SolarTerm term = getTerm();
    if (term.isQi()) {
      term = term.next(-1);
    }
    int dayIndex = subtract(term.getSolarDay());
    int startIndex = (term.getIndex() - 1) * 3;
    String data = "93705542220504xx1513904541632524533533105544806564xx7573304542018584xx95".substring(startIndex, startIndex + 6);
    int days = 0;
    int heavenStemIndex = 0;
    int typeIndex = 0;
    while (typeIndex < 3) {
      int i = typeIndex * 2;
      String d = data.substring(i, i + 1);
      int count = 0;
      if (d != "x") {
        heavenStemIndex = int.parse(d);
        count = dayCounts[int.parse(data.substring(i + 1, i + 2))];
        days += count;
      }
      if (dayIndex <= days) {
        dayIndex -= days - count;
        break;
      }
      typeIndex++;
    }
    return HideHeavenStemDay(HideHeavenStem.fromIndex(heavenStemIndex, HideHeavenStemType.fromCode(typeIndex)!), dayIndex);
  }
}
