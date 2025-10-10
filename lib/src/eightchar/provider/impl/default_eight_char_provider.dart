import '../../../lunar/lunar_hour.dart';
import '../../eight_char.dart';
import '../eight_char_provider.dart';

/// 默认八字计算（晚子时日柱算第二天）
///
/// Author: 6tail
class DefaultEightCharProvider implements EightCharProvider {
  @override
  EightChar getEightChar(LunarHour hour) {
    return hour.getSixtyCycleHour().getEightChar();
  }
}
