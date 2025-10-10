import '../../../solar/solar_term.dart';
import '../../../solar/solar_time.dart';
import '../../child_limit_info.dart';
import 'abstract_child_limit_provider.dart';

/// Lunar的流派2童限计算（按分钟数计算）
///
/// Author: 6tail
class LunarSect2ChildLimitProvider extends AbstractChildLimitProvider {
  @override
  ChildLimitInfo getInfo(SolarTime birthTime, SolarTerm term) {
    // 出生时刻和节令时刻相差的分钟数
    int minutes = (term.getJulianDay().getSolarTime().subtract(birthTime)).abs() ~/ 60;
    int year = minutes ~/ 4320;
    minutes %= 4320;
    int month = minutes ~/ 360;
    minutes %= 360;
    int day = minutes ~/ 12;
    minutes %= 12;
    int hour = minutes * 2;

    return next(birthTime, year, month, day, hour, 0, 0);
  }
}
