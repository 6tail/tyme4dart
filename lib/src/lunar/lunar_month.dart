import '../abstract_tyme.dart';
import '../culture/direction.dart';
import '../culture/fetus/fetus_month.dart';
import '../culture/ren/minor_ren.dart';
import '../culture/star/nine/nine_star.dart';
import '../jd/julian_day.dart';
import '../sixtycycle/earth_branch.dart';
import '../sixtycycle/heaven_stem.dart';
import '../sixtycycle/sixty_cycle.dart';
import '../solar/solar_term.dart';
import '../util/shou_xing_util.dart';
import 'lunar_day.dart';
import 'lunar_season.dart';
import 'lunar_week.dart';
import 'lunar_year.dart';

/// 农历月
///
/// Author: 6tail
class LunarMonth extends AbstractTyme {
  /// 缓存
  static final Map<String, List<Object>> _cache = {};

  static const List<String> names = ["正月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];

  /// 农历年
  late final LunarYear year;

  /// 月
  late final int month;

  /// 是否闰月
  late final bool leap;

  /// 天数
  late final int dayCount;

  /// 位于当年的索引，0-12
  late final int indexInYear;

  /// 初一的儒略日
  late final JulianDay firstJulianDay;

  LunarMonth._fromCache(List<Object> cache) {
    int m = cache[1] as int;
    year = LunarYear(cache[0] as int);
    month = m.abs();
    leap = m < 0;
    dayCount = cache[2] as int;
    indexInYear = cache[3] as int;
    firstJulianDay = JulianDay(cache[4] as double);
  }

  LunarMonth(int year, int month) {
    LunarYear currentYear = LunarYear(year);
    int currentLeapMonth = currentYear.getLeapMonth();
    if (month == 0 || month > 12 || month < -12) {
      throw ArgumentError('illegal lunar month: $month');
    }
    bool leap = month < 0;
    int m = month.abs();
    if (leap && m != currentLeapMonth) {
      throw ArgumentError('illegal leap month $m in lunar year $year');
    }

    // 冬至（与 Java 保持一致，使用本公历年的冬至）
    double dongZhiJd = SolarTerm(year, 0).getCursoryJulianDay();

    // 冬至前的初一，今年首朔的日月黄经差
    double w = ShouXingUtil.calcShuo(dongZhiJd);
    if (w > dongZhiJd) {
      w -= 29.53;
    }

    // 正常情况正月初一为第3个朔日，但有些特殊的
    int offset = 2;
    if (year > 8 && year < 24) {
      offset = 1;
    } else if (LunarYear(year - 1).getLeapMonth() > 10 && year != 239 && year != 240) {
      offset = 3;
    }

    // 位于当年的索引（与 Java 一致：闰月位于对应月份之后）
    int index = m - 1;
    if (leap || (currentLeapMonth > 0 && m > currentLeapMonth)) {
      index += 1;
    }
    indexInYear = index;

    // 本月初一
    w += 29.5306 * (offset + index);
    double firstDay = ShouXingUtil.calcShuo(w);
    firstJulianDay = JulianDay.fromJulianDay(JulianDay.j2000 + firstDay);
    // 本月天数 = 下月初一 - 本月初一
    dayCount = (ShouXingUtil.calcShuo(w + 29.5306) - firstDay).toInt();
    this.year = currentYear;
    this.month = m;
    this.leap = leap;
  }

  /// 从农历[year]年[month]月(闰月为负)初始化
  static LunarMonth fromYm(int year, int month) {
    String key = '$year$month';
    List<Object>? c = _cache[key];
    if (c != null) {
      return LunarMonth._fromCache(c);
    } else {
      LunarMonth m = LunarMonth(year, month);
      _cache[key] = [m.getYear(), m.getMonthWithLeap(), m.getDayCount(), m.getIndexInYear(), m.getFirstJulianDay().getDay()];
      return m;
    }
  }

  /// 农历年
  LunarYear getLunarYear() => year;

  /// 年
  int getYear() => year.getYear();

  /// 月
  int getMonth() => month;

  /// 月，当月为闰月时，返回负数
  int getMonthWithLeap() => leap ? -month : month;

  /// 天数(大月30天，小月29天)
  int getDayCount() => dayCount;

  /// 位于当年的索引(0-12)
  int getIndexInYear() => indexInYear;

  /// 农历季节
  LunarSeason getSeason() => LunarSeason(month - 1);

  /// 初一的儒略日
  JulianDay getFirstJulianDay() => firstJulianDay;

  /// 是否闰月
  bool isLeap() => leap;

  /// 以[start]为起始星期(1234560分别代表星期一至星期天)的周数
  int getWeekCount(int start) => ((indexOfSize(firstJulianDay.getWeek().getIndex() - start, 7) + getDayCount()) / 7).ceil();

  /// 名称，依据国家标准《农历的编算和颁行》GB/T 33661-2017中农历月的命名方法。
  @override
  String getName() => (leap ? "闰" : "") + names[month - 1];

  @override
  String toString() => '$year${getName()}';

  @override
  LunarMonth next(int n) {
    if (n == 0) {
      return fromYm(getYear(), getMonthWithLeap());
    }
    int m = indexInYear + 1 + n;
    LunarYear y = year;
    if (n > 0) {
      int monthCount = y.getMonthCount();
      while (m > monthCount) {
        m -= monthCount;
        y = y.next(1);
        monthCount = y.getMonthCount();
      }
    } else {
      while (m <= 0) {
        y = y.next(-1);
        m += y.getMonthCount();
      }
    }
    bool leapFlag = false;
    int leapMonth = y.getLeapMonth();
    if (leapMonth > 0) {
      if (m == leapMonth + 1) {
        leapFlag = true;
      }
      if (m > leapMonth) {
        m--;
      }
    }
    return fromYm(y.getYear(), leapFlag ? -m : m);
  }

  /// 本月的农历日列表
  List<LunarDay> getDays() {
    int size = getDayCount();
    int y = getYear();
    int m = getMonthWithLeap();
    List<LunarDay> l = [];
    for (int i = 1; i <= size; i++) {
      l.add(LunarDay(y, m, i));
    }
    return l;
  }

  /// 以[start]为起始星期(1234560分别代表星期一至星期天)农历周列表
  List<LunarWeek> getWeeks(int start) {
    int size = getWeekCount(start);
    int y = getYear();
    int m = getMonthWithLeap();
    List<LunarWeek> l = [];
    for (int i = 0; i < size; i++) {
      l.add(LunarWeek(y, m, i, start));
    }
    return l;
  }

  /// 干支
  SixtyCycle getSixtyCycle() => SixtyCycle.fromName('${HeavenStem(year.getSixtyCycle().getHeavenStem().getIndex() * 2 + month + 1).getName()}${EarthBranch(month + 1).getName()}');

  /// 九星
  NineStar getNineStar() {
    int index = getSixtyCycle().getEarthBranch().getIndex();
    if (index < 2) {
      index += 3;
    }
    return NineStar(27 - year.getSixtyCycle().getEarthBranch().getIndex() % 3 * 3 - index);
  }

  /// 太岁方位
  Direction getJupiterDirection() {
    SixtyCycle sixtyCycle = getSixtyCycle();
    int n = [7, -1, 1, 3][sixtyCycle.getEarthBranch().next(-2).getIndex() % 4];
    return n != -1 ? Direction(n) : sixtyCycle.getHeavenStem().getDirection();
  }

  /// 逐月胎神
  FetusMonth? getFetus() => FetusMonth.fromLunarMonth(this);

  /// 小六壬
  MinorRen getMinorRen() => MinorRen.fromIndex((month - 1) % 6);
}
