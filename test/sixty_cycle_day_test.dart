import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 干支日测试
///
/// Author: 6tail
void main() {
  group('SixtyCycleDay Tests', () {
    test('test0 - 2025年2月3日为乙巳年戊寅月癸卯日', () {
      expect(SixtyCycleDay.fromSolarDay(SolarDay.fromYmd(2025, 2, 3)).toString(), equals('乙巳年戊寅月癸卯日'));
    });

    test('test1 - 2025年2月2日为甲辰年丁丑月壬寅日', () {
      expect(SixtyCycleDay.fromSolarDay(SolarDay.fromYmd(2025, 2, 2)).toString(), equals('甲辰年丁丑月壬寅日'));
    });
  });
}
