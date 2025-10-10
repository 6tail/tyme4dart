import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 方位测试
///
/// Author: 6tail
void main() {
  group('Direction Tests', () {
    /// 福神方位
    test('test1 - 福神方位', () {
      expect(SolarDay.fromYmd(2021, 11, 13).getLunarDay().getSixtyCycle().getHeavenStem().getMascotDirection().getName(), '东南');
    });

    /// 福神方位
    test('test2 - 福神方位', () {
      expect(SolarDay.fromYmd(2024, 1, 1).getLunarDay().getSixtyCycle().getHeavenStem().getMascotDirection().getName(), '东南');
    });

    /// 太岁方位
    test('test3 - 太岁方位', () {
      expect(SolarDay.fromYmd(2023, 11, 6).getLunarDay().getJupiterDirection().getName(), '东');
    });
  });
}
