import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 建除十二值神测试
///
/// Author: 6tail
void main() {
  group('Duty Tests', () {
    test('test0 - 闭日', () {
      expect(SolarDay.fromYmd(2023, 10, 30).getLunarDay().getDuty().getName(), '闭');
      expect(SolarDay.fromYmd(2023, 10, 30).getSixtyCycleDay().getDuty().getName(), '闭');
    });

    test('test1 - 建日', () {
      expect(SolarDay.fromYmd(2023, 10, 19).getLunarDay().getDuty().getName(), '建');
      expect(SolarDay.fromYmd(2023, 10, 19).getSixtyCycleDay().getDuty().getName(), '建');
    });

    test('test2 - 除日', () {
      expect(SolarDay.fromYmd(2023, 10, 7).getLunarDay().getDuty().getName(), '除');
      expect(SolarDay.fromYmd(2023, 10, 7).getSixtyCycleDay().getDuty().getName(), '除');
    });

    test('test3 - 除日', () {
      expect(SolarDay.fromYmd(2023, 10, 8).getLunarDay().getDuty().getName(), '除');
      expect(SolarDay.fromYmd(2023, 10, 8).getSixtyCycleDay().getDuty().getName(), '除');
    });
  });
}
