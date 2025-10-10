import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 藏历年测试
///
/// Author: 6tail
void main() {
  group('RabByungYear Tests', () {
    test('test0 - 第一饶迥火兔年', () {
      var y = RabByungYear.fromElementZodiac(0, RabByungElement.fromName('火'), Zodiac.fromName('兔'));
      expect(y.getName(), '第一饶迥火兔年');
      expect(y.getSolarYear().getName(), '1027年');
      expect(y.getSixtyCycle().getName(), '丁卯');
      expect(y.getLeapMonth(), 10);
    });

    test('test1 - 1027年对应第一饶迥火兔年', () {
      expect(RabByungYear.fromYear(1027).getName(), '第一饶迥火兔年');
    });

    test('test2 - 2010年对应第十七饶迥铁虎年', () {
      expect(RabByungYear.fromYear(2010).getName(), '第十七饶迥铁虎年');
    });

    test('test3 - 闰月验证', () {
      expect(RabByungYear.fromYear(2043).getLeapMonth(), 5);
      expect(RabByungYear.fromYear(2044).getLeapMonth(), 0);
    });

    test('test4 - 1961年对应第十六饶迥铁牛年', () {
      expect(RabByungYear.fromYear(1961).getName(), '第十六饶迥铁牛年');
    });
  });
}
