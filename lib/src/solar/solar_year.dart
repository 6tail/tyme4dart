import '../abstract_tyme.dart';
import '../rabbyung/rab_byung_year.dart';
import 'solar_half_year.dart';
import 'solar_month.dart';
import 'solar_season.dart';

/// 公历年
///
/// Author: 6tail
class SolarYear extends AbstractTyme {
  /// 年
  final int year;

  SolarYear(this.year) {
    if (year < 1 || year > 9999) {
      throw ArgumentError('illegal solar year: $year');
    }
  }

  /// 从[year]年初始化，支持1到9999年
  SolarYear.fromYear(int year) : this(year);

  /// 年
  int getYear() => year;

  /// 天数（1582年355天，平年365天，闰年366天）
  int getDayCount() {
    if (1582 == year) {
      return 355;
    }
    return isLeap() ? 366 : 365;
  }

  /// 是否闰年(1582年以前，使用儒略历，能被4整除即为闰年。以后采用格里历，四年一闰，百年不闰，四百年再闰。)
  bool isLeap() {
    if (year < 1600) {
      return year % 4 == 0;
    }
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  @override
  String getName() => '$year年';

  @override
  SolarYear next(int n) => SolarYear(year + n);

  /// 月份列表，1年有12个月。
  List<SolarMonth> getMonths() {
    List<SolarMonth> l = [];
    for (int i = 1; i < 13; i++) {
      l.add(SolarMonth.fromYm(year, i));
    }
    return l;
  }

  /// 季度列表，1年有4个季度。
  List<SolarSeason> getSeasons() {
    List<SolarSeason> l = [];
    for (int i = 0; i < 4; i++) {
      l.add(SolarSeason.fromIndex(year, i));
    }
    return l;
  }

  /// 半年列表，1年有2个半年。
  List<SolarHalfYear> getHalfYears() {
    List<SolarHalfYear> l = [];
    for (int i = 0; i < 2; i++) {
      l.add(SolarHalfYear.fromIndex(year, i));
    }
    return l;
  }

  /// 藏历年
  RabByungYear getRabByungYear() => RabByungYear.fromYear(year);
}
