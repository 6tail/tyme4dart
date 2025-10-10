import '../../solar/solar_term.dart';
import '../../solar/solar_time.dart';
import '../child_limit_info.dart';

/// 童限计算接口
///
/// Author: 6tail
abstract class ChildLimitProvider {
  /// 通过[birthTime]出生公历时刻和[term]节令计算童限信息
  ChildLimitInfo getInfo(SolarTime birthTime, SolarTerm term);
}
