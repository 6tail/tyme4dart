import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 三柱测试
///
/// Author: 6tail
void main() {
  group('ThreePillars Tests', () {
    test('test0', () {
      List<SolarDay> solarDays = ThreePillars.fromName("甲戌", "甲戌", "甲戌").getSolarDays(1, 2200);
      List<String> actual = solarDays.map((e) => e.toString()).toList();

      List<String> expected = ['14年10月17日', '194年11月1日', '254年10月17日', '434年11月1日', '494年10月17日', '674年11月1日', '734年10月17日', '794年10月2日', '974年10月17日', '1034年10月2日', '1214年10月17日', '1274年10月2日', '1454年10月17日', '1514年10月2日', '1694年10月27日', '1754年10月13日', '1934年10月30日', '1994年10月15日', '2174年10月31日'];
      expect(actual, expected);
    });

    test('test1', () {
      expect(SolarDay.fromYmd(1034, 10, 2).getSixtyCycleDay().getThreePillars().getName(), '甲戌 甲戌 甲戌');
    });
  });
}
