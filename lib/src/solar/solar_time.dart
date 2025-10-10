import '../abstract_tyme.dart';
import '../culture/phase.dart';
import '../culture/phenology/phenology.dart';
import '../jd/julian_day.dart';
import '../lunar/lunar_day.dart';
import '../lunar/lunar_hour.dart';
import '../lunar/lunar_month.dart';
import '../sixtycycle/sixty_cycle_hour.dart';
import 'solar_day.dart';
import 'solar_term.dart';

/// 公历时刻
///
/// Author: 6tail
class SolarTime extends AbstractTyme {
  /// 公历日
  late final SolarDay day;

  /// 时
  final int hour;

  /// 分
  final int minute;

  /// 秒
  final int second;

  SolarTime(int year, int month, int day, this.hour, this.minute, this.second) {
    if (hour < 0 || hour > 23) {
      throw ArgumentError('illegal hour: $hour');
    }
    if (minute < 0 || minute > 59) {
      throw ArgumentError('illegal minute: $minute');
    }
    if (second < 0 || second > 59) {
      throw ArgumentError('illegal second: $second');
    }
    this.day = SolarDay(year, month, day);
  }

  SolarTime.fromYmdHms(int year, int month, int day, int hour, int minute, int second) : this(year, month, day, hour, minute, second);

  /// 公历日
  SolarDay getSolarDay() => day;

  /// 年
  int getYear() => day.getYear();

  /// 月
  int getMonth() => day.getMonth();

  /// 日
  int getDay() => day.getDay();

  /// 时
  int getHour() => hour;

  /// 分
  int getMinute() => minute;

  /// 秒
  int getSecond() => second;

  @override
  String getName() => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';

  @override
  String toString() => '$day ${getName()}';

  /// 是否在[target]指定公历时刻之前
  bool isBefore(SolarTime target) {
    if (day != target.getSolarDay()) {
      return day.isBefore(target.getSolarDay());
    }
    if (hour != target.getHour()) {
      return hour < target.getHour();
    }
    return minute != target.getMinute() ? minute < target.getMinute() : second < target.getSecond();
  }

  /// 是否在[target]指定公历时刻之后
  bool isAfter(SolarTime target) {
    if (day != target.getSolarDay()) {
      return day.isAfter(target.getSolarDay());
    }
    if (hour != target.getHour()) {
      return hour > target.getHour();
    }
    return minute != target.getMinute() ? minute > target.getMinute() : second > target.getSecond();
  }

  /// 儒略日
  JulianDay getJulianDay() => JulianDay.fromYmdHms(getYear(), getMonth(), getDay(), hour, minute, second);

  /// 与[target]公历时刻相减，获得相差秒数
  int subtract(SolarTime target) {
    int days = day.subtract(target.getSolarDay());
    int cs = hour * 3600 + minute * 60 + second;
    int ts = target.getHour() * 3600 + target.getMinute() * 60 + target.getSecond();
    int seconds = cs - ts;
    if (seconds < 0) {
      seconds += 86400;
      days--;
    }
    seconds += days * 86400;
    return seconds;
  }

  /// 推移[n]秒
  @override
  SolarTime next(int n) {
    if (n == 0) {
      return SolarTime.fromYmdHms(getYear(), getMonth(), getDay(), hour, minute, second);
    }
    int ts = second + n;
    int tm = minute + (ts / 60).floor();
    ts = ts % 60;
    if (ts < 0) {
      ts += 60;
      tm -= 1;
    }
    int th = hour + (tm / 60).floor();
    tm = tm % 60;
    if (tm < 0) {
      tm += 60;
      th -= 1;
    }
    int td = (th / 24).floor();
    th = th % 24;
    if (th < 0) {
      th += 24;
      td -= 1;
    }

    SolarDay d = day.next(td);
    return SolarTime.fromYmdHms(d.getYear(), d.getMonth(), d.getDay(), th, tm, ts);
  }

  /// 农历时辰
  LunarHour getLunarHour() {
    LunarDay d = day.getLunarDay();
    return LunarHour.fromYmdHms(d.getYear(), d.getMonth(), d.getDay(), hour, minute, second);
  }

  /// 候
  Phenology getPhenology() {
    Phenology p = day.getPhenology();
    if (isBefore(p.getJulianDay().getSolarTime())) {
      p = p.next(-1);
    }
    return p;
  }

  /// 干支时辰
  SixtyCycleHour getSixtyCycleHour() => SixtyCycleHour.fromSolarTime(this);

  /// 节气
  SolarTerm getTerm() {
    SolarTerm term = day.getTerm();
    if (isBefore(term.getJulianDay().getSolarTime())) {
      term = term.next(-1);
    }
    return term;
  }

  /// 月相
  Phase getPhase() {
    LunarMonth lunarMonth = getLunarHour().day.month.next(1);
    Phase p = Phase.fromIndex(lunarMonth.year.getYear(), lunarMonth.getMonthWithLeap(), 0);
    while (p.getSolarTime().isAfter(this)) {
      p = p.next(-1);
    }
    return p;
  }
}
