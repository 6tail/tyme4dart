import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 六曜测试
///
/// Author: 6tail
void main() {
  group('SixStar Tests', () {
    test('test0 - 佛灭', () {
      expect(SolarDay.fromYmd(2020, 4, 23).getLunarDay().getSixStar().getName(), '佛灭');
    });

    test('test1 - 友引', () {
      expect(SolarDay.fromYmd(2021, 1, 15).getLunarDay().getSixStar().getName(), '友引');
    });

    test('test2 - 先胜', () {
      expect(SolarDay.fromYmd(2017, 1, 5).getLunarDay().getSixStar().getName(), '先胜');
    });

    test('test3 - 友引', () {
      expect(SolarDay.fromYmd(2020, 4, 10).getLunarDay().getSixStar().getName(), '友引');
    });

    test('test4 - 大安', () {
      expect(SolarDay.fromYmd(2020, 6, 11).getLunarDay().getSixStar().getName(), '大安');
    });

    test('test5 - 先胜', () {
      expect(SolarDay.fromYmd(2020, 6, 1).getLunarDay().getSixStar().getName(), '先胜');
    });

    test('test6 - 先负', () {
      expect(SolarDay.fromYmd(2020, 12, 8).getLunarDay().getSixStar().getName(), '先负');
    });

    test('test8 - 赤口', () {
      expect(SolarDay.fromYmd(2020, 12, 11).getLunarDay().getSixStar().getName(), '赤口');
    });
  });
}
