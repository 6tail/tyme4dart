import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 干支时辰测试
///
/// Author: 6tail
void main() {
  group('SixtyCycleHour Tests', () {
    test('test0 - 2025年2月3日23:00 为乙巳年戊寅月甲辰日甲子时', () {
      final hour = SolarTime.fromYmdHms(2025, 2, 3, 23, 0, 0).getSixtyCycleHour();
      expect(hour.toString(), equals('乙巳年戊寅月甲辰日甲子时'));

      final day = hour.getSixtyCycleDay();
      expect(day.toString(), equals('乙巳年戊寅月甲辰日'));
      expect(day.getSolarDay().toString(), equals('2025年2月3日'));
    });

    test('test1 - 2025年2月3日04:00 为甲辰年丁丑月癸卯日甲寅时', () {
      final hour = SolarTime.fromYmdHms(2025, 2, 3, 4, 0, 0).getSixtyCycleHour();
      expect(hour.toString(), equals('甲辰年丁丑月癸卯日甲寅时'));

      final day = hour.getSixtyCycleDay();
      expect(day.toString(), equals('甲辰年丁丑月癸卯日'));
      expect(day.getSolarDay().toString(), equals('2025年2月3日'));
    });

    test('test2 - 2025年2月3日22:30 为乙巳年戊寅月癸卯日癸亥时', () {
      final hour = SolarTime.fromYmdHms(2025, 2, 3, 22, 30, 0).getSixtyCycleHour();
      expect(hour.toString(), equals('乙巳年戊寅月癸卯日癸亥时'));

      final day = hour.getSixtyCycleDay();
      expect(day.toString(), equals('乙巳年戊寅月癸卯日'));
      expect(day.getSolarDay().toString(), equals('2025年2月3日'));
    });

    test('test3 - 1988年2月15日23:30 八字为戊辰甲寅辛丑戊子', () {
      final eightChar = SolarTime.fromYmdHms(1988, 2, 15, 23, 30, 0).getSixtyCycleHour().getEightChar();

      expect(eightChar.getYear().getName(), equals('戊辰'));
      expect(eightChar.getMonth().getName(), equals('甲寅'));
      expect(eightChar.getDay()?.getName(), equals('辛丑'));
      expect(eightChar.getHour().getName(), equals('戊子'));
    });
  });
}
