import '../loop_tyme.dart';
import '../jd/julian_day.dart';
import '../lunar/lunar_day.dart';
import '../lunar/lunar_month.dart';
import '../solar/solar_day.dart';
import '../solar/solar_time.dart';
import '../util/shou_xing_util.dart';

/// 月相（月日黄经差：新月0，蛾眉月0-90，上弦月90，盈凸月90-180，满月180，亏凸月180-270，下弦月270，残月270-360）
///
/// Author: 6tail
class Phase extends LoopTyme {
  static const List<String> names = ['新月', '蛾眉月', '上弦月', '盈凸月', '满月', '亏凸月', '下弦月', '残月'];

  /// 农历年
  late final int lunarYear;

  /// 农历月
  late final int lunarMonth;

  Phase(int lunarYear, int lunarMonth, int index) : super(names, index) {
    LunarMonth m = LunarMonth.fromYm(lunarYear, lunarMonth).next(index ~/ getSize());
    this.lunarYear = m.getYear();
    this.lunarMonth = m.getMonthWithLeap();
  }

  Phase.fromIndex(int lunarYear, int lunarMonth, int index) : this(lunarYear, lunarMonth, index);

  Phase.fromName(this.lunarYear, this.lunarMonth, String name) : super.fromName(names, name);

  @override
  Phase next(int n) {
    int size = getSize();
    int i = index + n;
    if (i < 0) {
      i -= size;
    }
    i = (i / size).truncate();
    LunarMonth m = LunarMonth(lunarYear, lunarMonth);
    if (i != 0) {
      m = m.next(i);
    }
    return Phase(m.getYear(), m.getMonthWithLeap(), nextIndex(n));
  }

  SolarTime _getStartSolarTime() {
    int n = ((lunarYear - 2000) * 365.2422 / 29.53058886).floor();
    int i = 0;
    double jd = JulianDay.j2000 + ShouXingUtil.oneThird;
    SolarDay d = LunarDay(lunarYear, lunarMonth, 1).getSolarDay();
    while (true) {
      double t = ShouXingUtil.msaLonT((n + i) * ShouXingUtil.pi2) * 36525;
      if (!JulianDay(jd + t - ShouXingUtil.dtT(t)).getSolarDay().isBefore(d)) {
        break;
      }
      i++;
    }
    double t = ShouXingUtil.msaLonT((n + i + [0, 90, 180, 270][(index / 2).floor()] / 360.0) * ShouXingUtil.pi2) * 36525;
    return JulianDay(jd + t - ShouXingUtil.dtT(t)).getSolarTime();
  }

  /// 公历时刻
  SolarTime getSolarTime() {
    SolarTime t = _getStartSolarTime();
    return index % 2 == 1 ? t.next(1) : t;
  }

  /// 公历日
  SolarDay getSolarDay() {
    SolarDay d = _getStartSolarTime().getSolarDay();
    return index % 2 == 1 ? d.next(1) : d;
  }
}
