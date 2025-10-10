import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 胎神测试
///
/// Author: 6tail
void main() {
  group('Fetus Tests', () {
    /// 逐日胎神
    test('test1 - 2021年11月13日胎神', () {
      expect(SolarDay.fromYmd(2021, 11, 13).getLunarDay().getFetusDay().getName(), '碓磨厕 外东南');
    });

    test('test2 - 2021年11月12日胎神', () {
      expect(SolarDay.fromYmd(2021, 11, 12).getLunarDay().getFetusDay().getName(), '占门碓 外东南');
    });

    test('test3 - 2011年11月12日胎神', () {
      expect(SolarDay.fromYmd(2011, 11, 12).getLunarDay().getFetusDay().getName(), '厨灶厕 外西南');
    });
  });
}
