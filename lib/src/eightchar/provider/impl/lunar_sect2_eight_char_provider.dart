import '../../../lunar/lunar_hour.dart';
import '../../../sixtycycle/sixty_cycle_hour.dart';
import '../../eight_char.dart';
import '../eight_char_provider.dart';

/// 流派2八字计算（晚子时日柱算当天）
///
/// Author: 6tail
class LunarSect2EightCharProvider implements EightCharProvider {
  @override
  EightChar getEightChar(LunarHour hour) {
    SixtyCycleHour h = hour.getSixtyCycleHour();
    return EightChar(h.getYear(), h.getMonth(), hour.getLunarDay().getSixtyCycle(), h.getSixtyCycle());
  }
}
