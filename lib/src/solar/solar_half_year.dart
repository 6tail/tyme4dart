import '../abstract_tyme.dart';
import 'solar_month.dart';
import 'solar_season.dart';
import 'solar_year.dart';

/// 公历半年
///
/// Author: 6tail
class SolarHalfYear extends AbstractTyme {
  static const List<String> names = ['上半年', '下半年'];

  /// 年
  final SolarYear year;

  /// 索引，0-1
  final int index;

  /// 使用[year]年和[index]索引初始化，索引范围为0-1
  SolarHalfYear(int year, this.index) : year = SolarYear.fromYear(year) {
    if (index < 0 || index > 1) {
      throw ArgumentError('illegal solar half year index: $index');
    }
  }

  SolarHalfYear.fromIndex(int year, int index) : this(year, index);

  /// 公历年
  SolarYear getSolarYear() => year;

  /// 年
  int getYear() => year.getYear();

  /// 索引，0-1
  int getIndex() => index;

  @override
  String getName() => names[index];

  @override
  String toString() => '$year${getName()}';

  @override
  SolarHalfYear next(int n) {
    int i = index + n;
    return SolarHalfYear((getYear() * 2 + i) ~/ 2, indexOfSize(i, 2));
  }

  /// 月份列表，半年有6个月。
  List<SolarMonth> getMonths() {
    List<SolarMonth> l = [];
    int y = getYear();
    for (int i = 1; i < 7; i++) {
      l.add(SolarMonth.fromYm(y, index * 6 + i));
    }
    return l;
  }

  /// 季度列表，半年有2个季度。
  List<SolarSeason> getSeasons() {
    List<SolarSeason> l = [];
    int y = getYear();
    for (int i = 0; i < 2; i++) {
      l.add(SolarSeason.fromIndex(y, index * 2 + i));
    }
    return l;
  }
}
