import '../abstract_tyme.dart';
import '../culture/zodiac.dart';
import '../solar/solar_day.dart';
import 'rab_byung_element.dart';
import 'rab_byung_month.dart';

/// 藏历日，仅支持藏历1950年十二月初一（公历1951年1月8日）至藏历2050年十二月三十（公历2051年2月11日）
///
/// Author: 6tail
class RabByungDay extends AbstractTyme {
  static const List<String> names = [
    '初一', '初二', '初三', '初四', '初五',
    '初六', '初七', '初八', '初九', '初十',
    '十一', '十二', '十三', '十四', '十五',
    '十六', '十七', '十八', '十九', '二十',
    '廿一', '廿二', '廿三', '廿四', '廿五',
    '廿六', '廿七', '廿八', '廿九', '三十'
  ];

  /// 藏历月
  final RabByungMonth month;

  /// 日
  final int day;

  /// 是否闰日
  final bool leap;

  RabByungDay(this.month, int day)
      : day = day.abs(),
        leap = day < 0 {
    if (day == 0 || day < -30 || day > 30) {
      throw ArgumentError('illegal day $day in $month');
    }
    int d = this.day;
    if (leap && !month.getLeapDays().contains(d)) {
      throw ArgumentError('illegal leap day $d in $month');
    } else if (!leap && month.getMissDays().contains(d)) {
      throw ArgumentError('illegal day $d in $month');
    }
  }

  /// 从藏历年月日初始化
  RabByungDay._fromYmd(int year, int month, int day)
      : this(RabByungMonth.fromYm(year, month), day);

  RabByungDay._fromElementZodiac(
      int rabByungIndex, RabByungElement element, Zodiac zodiac, int month, int day)
      : this(RabByungMonth.fromElementZodiac(rabByungIndex, element, zodiac, month), day);

  static RabByungDay fromYmd(int year, int month, int day) {
    return RabByungDay._fromYmd(year, month, day);
  }

  static RabByungDay fromElementZodiac(
      int rabByungIndex, RabByungElement element, Zodiac zodiac, int month, int day) {
    return RabByungDay._fromElementZodiac(rabByungIndex, element, zodiac, month, day);
  }

  static RabByungDay fromSolarDay(SolarDay solarDay) {
    int days = solarDay.subtract(SolarDay.fromYmd(1951, 1, 8));
    RabByungMonth m = RabByungMonth.fromYm(1950, 12);
    int count = m.getDayCount();
    while (days >= count) {
      days -= count;
      m = m.next(1);
      count = m.getDayCount();
    }
    int day = days + 1;
    for (int d in m.getSpecialDays()) {
      if (d < 0) {
        if (day >= -d) {
          day++;
        }
      } else if (d > 0) {
        if (day == d + 1) {
          day = -d;
          break;
        } else if (day > d + 1) {
          day--;
        }
      }
    }
    return RabByungDay(m, day);
  }

  /// 藏历月
  RabByungMonth getRabByungMonth() => month;

  /// 年
  int getYear() => month.getYear();

  /// 月
  int getMonth() => month.getMonthWithLeap();

  /// 日
  int getDay() => day;

  /// 是否闰日
  bool isLeap() => leap;

  /// 日（闰日返回负数）
  int getDayWithLeap() => leap ? -day : day;

  @override
  String getName() => (leap ? '闰' : '') + names[day - 1];

  @override
  String toString() => month.toString() + getName();

  /// 藏历日相减
  int subtract(RabByungDay target) {
    return getSolarDay().subtract(target.getSolarDay());
  }

  /// 公历日
  SolarDay getSolarDay() {
    RabByungMonth m = RabByungMonth.fromYm(1950, 12);
    int n = 0;
    while (month != m) {
      n += m.getDayCount();
      m = m.next(1);
    }
    int t = day;
    for (int d in m.getSpecialDays()) {
      if (d < 0) {
        if (t > -d) {
          t--;
        }
      } else if (d > 0) {
        if (t > d) {
          t++;
        }
      }
    }
    if (leap) {
      t++;
    }
    return SolarDay.fromYmd(1951, 1, 7).next(n + t);
  }

  @override
  RabByungDay next(int n) {
    return getSolarDay().next(n).getRabByungDay();
  }
}
