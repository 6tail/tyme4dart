import '../abstract_tyme.dart';
import '../culture/week.dart';
import '../solar/solar_day.dart';
import '../solar/solar_time.dart';

/// 儒略日
///
/// Author: 6tail
class JulianDay extends AbstractTyme {
  /// 2000年儒略日数(2000-1-1 12:00:00 UTC)
  static const double j2000 = 2451545;

  /// 儒略日
  final double day;

  JulianDay(this.day);

  /// 从儒略日数创建
  ///
  /// [day] 儒略日数
  JulianDay.fromJulianDay(double day) : this(day);

  /// 从年月日时分秒创建儒略日
  ///
  /// [year] 年
  /// [month] 月
  /// [day] 日
  /// [hour] 时
  /// [minute] 分
  /// [second] 秒
  static JulianDay fromYmdHms(int year, int month, int day, int hour, int minute, int second) {
    double d = day + ((second * 1.0 / 60 + minute) / 60 + hour) / 24;
    int n = 0;
    bool g = year * 372 + month * 31 + d.toInt() >= 588829;
    if (month <= 2) {
      month += 12;
      year--;
    }
    if (g) {
      n = (year * 0.01).toInt();
      n = 2 - n + (n * 0.25).toInt();
    }
    return JulianDay((365.25 * (year + 4716)).toInt() + (30.6001 * (month + 1)).toInt() + d + n - 1524.5);
  }

  /// 儒略日数
  double getDay() => day;

  @override
  String getName() => day.toString();

  @override
  JulianDay next(int n) => JulianDay(day + n);

  /// 公历日
  SolarDay getSolarDay() => getSolarTime().getSolarDay();

  /// 公历时刻
  SolarTime getSolarTime() {
    int d = (day + 0.5).toInt();
    double f = day + 0.5 - d;

    if (d >= 2299161) {
      int c = ((d - 1867216.25) / 36524.25).toInt();
      d += 1 + c - (c * 0.25).toInt();
    }
    d += 1524;
    int y = ((d - 122.1) / 365.25).toInt();
    d -= (365.25 * y).toInt();
    int m = (d / 30.601).toInt();
    d -= (30.601 * m).toInt();
    if (m > 13) {
      m -= 12;
    } else {
      y -= 1;
    }
    m -= 1;
    y -= 4715;
    f *= 24;
    int hour = f.toInt();

    f -= hour;
    f *= 60;
    int minute = f.toInt();

    f -= minute;
    f *= 60;
    int second = f.round();
    return second < 60 ? SolarTime.fromYmdHms(y, m, d, hour, minute, second) : SolarTime.fromYmdHms(y, m, d, hour, minute, second - 60).next(60);
  }

  SolarTime get solarTime => getSolarTime();

  /// 星期
  Week getWeek() => Week.fromIndex((day + 0.5).toInt() + 7000001);

  /// 儒略日相减
  ///
  /// [target] 目标儒略日
  double subtract(JulianDay target) => day - target.getDay();
}
