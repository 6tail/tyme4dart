import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 梅雨天测试
///
/// Author: 6tail
void main() {
  group('PlumRainDay Tests', () {
    test('test0 - 2024年6月10日不在梅雨期', () {
      final d = SolarDay.fromYmd(2024, 6, 10).getPlumRainDay();
      expect(d, isNull);
    });

    test('test1 - 2024年6月11日入梅第1天', () {
      final d = SolarDay.fromYmd(2024, 6, 11).getPlumRainDay();
      expect(d, isNotNull);
      expect(d!.getName(), '入梅');
      expect(d.getPlumRain().toString(), '入梅');
      expect(d.toString(), '入梅第1天');
    });

    test('test2 - 2024年7月6日出梅', () {
      final d = SolarDay.fromYmd(2024, 7, 6).getPlumRainDay();
      expect(d, isNotNull);
      expect(d!.getName(), '出梅');
      expect(d.getPlumRain().toString(), '出梅');
      expect(d.toString(), '出梅');
    });

    test('test3 - 2024年7月5日入梅第25天', () {
      final d = SolarDay.fromYmd(2024, 7, 5).getPlumRainDay();
      expect(d, isNotNull);
      expect(d!.getName(), '入梅');
      expect(d.getPlumRain().toString(), '入梅');
      expect(d.toString(), '入梅第25天');
    });
  });
}
