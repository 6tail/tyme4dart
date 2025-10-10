import '../abstract_tyme.dart';
import 'solar_day.dart';
import 'solar_season.dart';
import 'solar_week.dart';
import 'solar_year.dart';

/// 公历月
///
/// Author: 6tail
class SolarMonth extends AbstractTyme {
  static const List<String> names = ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'];

  /// 每月天数
  static const List<int> days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  /// 年
  final SolarYear year;

  /// 月
  final int month;

  SolarMonth(int year, this.month) : year = SolarYear.fromYear(year) {
    if (month < 1 || month > 12) {
      throw ArgumentError('illegal solar month: $month');
    }
  }

  SolarMonth.fromYm(int year, int month) : this(year, month);

  /// 公历年
  SolarYear getSolarYear() => year;

  /// 年
  int getYear() => year.getYear();

  /// 月
  int getMonth() => month;

  /// 天数（1582年10月只有21天)
  int getDayCount() {
    if (1582 == getYear() && 10 == month) {
      return 21;
    }
    int d = days[getIndexInYear()];
    //公历闰年2月多一天
    if (2 == month && year.isLeap()) {
      d++;
    }
    return d;
  }

  /// 位于当年的索引，0-11
  int getIndexInYear() => month - 1;

  /// 公历季度
  SolarSeason getSeason() => SolarSeason(getYear(), getIndexInYear() ~/ 3);

  /// 周数
  int getWeekCount(int start) => ((indexOfSize(SolarDay.fromYmd(getYear(), month, 1).getWeek().getIndex() - start, 7) + getDayCount()) / 7).ceil();

  @override
  String getName() => names[getIndexInYear()];

  @override
  String toString() => '$year${getName()}';

  @override
  SolarMonth next(int n) {
    int i = month - 1 + n;
    return SolarMonth((getYear() * 12 + i) ~/ 12, indexOfSize(i, 12) + 1);
  }

  /// 公历周列表
  /// [start]星期几作为一周的开始，1234560分别代表星期一至星期天
  List<SolarWeek> getWeeks(int start) {
    int size = getWeekCount(start);
    int y = getYear();
    List<SolarWeek> l = [];
    for (int i = 0; i < size; i++) {
      l.add(SolarWeek.fromYm(y, month, i, start));
    }
    return l;
  }

  /// 公历日列表
  List<SolarDay> getDays() {
    int size = getDayCount();
    int y = getYear();
    List<SolarDay> l = [];
    for (int i = 1; i <= size; i++) {
      l.add(SolarDay.fromYmd(y, month, i));
    }
    return l;
  }
}
