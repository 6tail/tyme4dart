import '../../../solar/solar_term.dart';
import '../../../solar/solar_time.dart';
import '../../child_limit_info.dart';
import 'abstract_child_limit_provider.dart';

/// 元亨利贞的童限计算
///
/// Author: 6tail
class China95ChildLimitProvider extends AbstractChildLimitProvider {
  @override
  ChildLimitInfo getInfo(SolarTime birthTime, SolarTerm term) {
    // 出生时刻和节令时刻相差的分钟数
    int minutes = (term.getJulianDay().getSolarTime().subtract(birthTime)).abs() ~/ 60;
    int year = minutes ~/ 4320;
    minutes %= 4320;
    int month = minutes ~/ 360;
    minutes %= 360;
    int day = minutes ~/ 12;

    return next(birthTime, year, month, day, 0, 0, 0);
  }
}
