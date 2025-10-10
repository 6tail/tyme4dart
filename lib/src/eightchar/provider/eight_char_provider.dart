import '../eight_char.dart';
import '../../lunar/lunar_hour.dart';

/// 八字计算接口
///
/// Author: 6tail
abstract class EightCharProvider {
  EightChar getEightChar(LunarHour hour);
}
