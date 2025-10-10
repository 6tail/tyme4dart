import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 公历年测试
///
/// Author: 6tail
void main() {
  group('SolarYear Tests', () {
    test('test0 - 年份名称', () {
      expect(SolarYear.fromYear(2023).getName(), '2023年');
    });

    test('test1 - 平年判断', () {
      expect(SolarYear.fromYear(2023).isLeap(), false);
    });

    test('test2 - 闰年判断（儒略历1500年）', () {
      expect(SolarYear.fromYear(1500).isLeap(), true);
    });

    test('test3 - 非闰年判断（格里高利历1700年）', () {
      expect(SolarYear.fromYear(1700).isLeap(), false);
    });

    test('test4 - 平年天数', () {
      expect(SolarYear.fromYear(2023).getDayCount(), 365);
    });

    test('test5 - 向前推移5年', () {
      expect(SolarYear.fromYear(2023).next(5).getName(), '2028年');
    });

    test('test6 - 向后推移5年', () {
      expect(SolarYear.fromYear(2023).next(-5).getName(), '2018年');
    });

    // test7 - 生成公历年历示例（打印测试，Dart中省略）
  });
}
