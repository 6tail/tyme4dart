import '../jd/julian_day.dart';
import '../loop_tyme.dart';
import '../util/shou_xing_util.dart';

/// 节气
///
/// Author: 6tail
class SolarTerm extends LoopTyme {
  static const List<String> names = ["冬至", "小寒", "大寒", "立春", "雨水", "惊蛰", "春分", "清明", "谷雨", "立夏", "小满", "芒种", "夏至", "小暑", "大暑", "立秋", "处暑", "白露", "秋分", "寒露", "霜降", "立冬", "小雪", "大雪"];

  /// 年
  late final int year;

  /// 粗略的儒略日
  late final double cursoryJulianDay;

  SolarTerm(int year, int index) : super(names, index) {
    int size = getSize();
    int y = (year * size + index) ~/ size;
    double jd = ((y - 2000) * 365.2422 + 180).floorToDouble();
    // 355是2000.12冬至，得到较靠近jd的冬至估计值
    double w = ((jd - 355 + 183) / 365.2422).floorToDouble() * 365.2422 + 355;
    if (ShouXingUtil.calcQi(w) > jd) {
      w -= 365.2422;
    }
    this.year = y;
    cursoryJulianDay = ShouXingUtil.calcQi(w + 15.2184 * getIndex());
  }

  SolarTerm.fromIndex(int year, int index) : this(year, index);

  SolarTerm.fromName(this.year, String name) : super.fromName(names, name) {
    double jd = ((year - 2000) * 365.2422 + 180).floorToDouble();
    // 355是2000.12冬至，得到较靠近jd的冬至估计值
    double w = ((jd - 355 + 183) / 365.2422).floorToDouble() * 365.2422 + 355;
    if (ShouXingUtil.calcQi(w) > jd) {
      w -= 365.2422;
    }
    cursoryJulianDay = ShouXingUtil.calcQi(w + 15.2184 * index);
  }

  @override
  SolarTerm next(int n) {
    int size = names.length;
    int i = index + n;
    return SolarTerm((year * size + i) ~/ size, i % size);
  }

  /// 是否节令
  bool isJie() => index % 2 == 1;

  /// 是否气令
  bool isQi() => index % 2 == 0;

  /// 儒略日
  JulianDay getJulianDay() => JulianDay(ShouXingUtil.qiAccurate2(cursoryJulianDay) + JulianDay.j2000);

  /// 获取年份
  int getYear() => year;

  /// 粗略的儒略日
  double getCursoryJulianDay() => cursoryJulianDay;
}
