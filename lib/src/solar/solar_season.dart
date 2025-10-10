import '../abstract_tyme.dart';
import 'solar_year.dart';
import 'solar_month.dart';

/// 公历季度
///
/// Author: 6tail
class SolarSeason extends AbstractTyme {
  static const List<String> names = ['一季度', '二季度', '三季度', '四季度'];

  /// 年
  final SolarYear year;

  /// 索引，0-3
  final int index;

  SolarSeason(int year, this.index) : year = SolarYear.fromYear(year) {
    if (index < 0 || index > 3) {
      throw ArgumentError('illegal solar season index: $index');
    }
  }

  SolarSeason.fromIndex(int year, int index) : this(year, index);

  /// 公历年
  SolarYear getSolarYear() => year;

  /// 年
  int getYear() => year.getYear();

  /// 索引，0-3
  int getIndex() => index;

  @override
  String getName() => names[index];

  @override
  String toString() => '$year${getName()}';

  @override
  SolarSeason next(int n) {
    int i = index + n;
    return SolarSeason((getYear() * 4 + i) ~/ 4, indexOfSize(i, 4));
  }

  /// 月份列表，1季度有3个月。
  List<SolarMonth> getMonths() {
    List<SolarMonth> l = [];
    int y = getYear();
    for (int i = 1; i < 4; i++) {
      l.add(SolarMonth.fromYm(y, index * 3 + i));
    }
    return l;
  }
}
