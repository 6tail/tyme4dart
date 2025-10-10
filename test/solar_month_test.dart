import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 公历月测试
///
/// Author: 6tail
void main() {
  group('SolarMonth Tests', () {
    test('test0 - 月份名称', () {
      var m = SolarMonth.fromYm(2019, 5);
      expect(m.getName(), '5月');
      expect(m.toString(), '2019年5月');
    });

    test('test1 - 2023年1月周数统计', () {
      var m = SolarMonth.fromYm(2023, 1);
      expect(m.getWeekCount(0), 5); // 周日开始
      expect(m.getWeekCount(1), 6); // 周一开始
      expect(m.getWeekCount(2), 6); // 周二开始
      expect(m.getWeekCount(3), 5); // 周三开始
      expect(m.getWeekCount(4), 5); // 周四开始
      expect(m.getWeekCount(5), 5); // 周五开始
      expect(m.getWeekCount(6), 5); // 周六开始
    });

    test('test2 - 2023年2月周数统计', () {
      var m = SolarMonth.fromYm(2023, 2);
      expect(m.getWeekCount(0), 5); // 周日开始
      expect(m.getWeekCount(1), 5); // 周一开始
      expect(m.getWeekCount(2), 5); // 周二开始
      expect(m.getWeekCount(3), 4); // 周三开始
      expect(m.getWeekCount(4), 5); // 周四开始
      expect(m.getWeekCount(5), 5); // 周五开始
      expect(m.getWeekCount(6), 5); // 周六开始
    });

    test('test3 - 月份推移', () {
      var m = SolarMonth.fromYm(2023, 10).next(1);
      expect(m.getName(), '11月');
      expect(m.toString(), '2023年11月');
    });

    test('test4 - 复杂月份推移', () {
      var m = SolarMonth.fromYm(2023, 10);
      expect(m.next(2).toString(), '2023年12月');
      expect(m.next(3).toString(), '2024年1月');
      expect(m.next(-5).toString(), '2023年5月');
      expect(m.next(-9).toString(), '2023年1月');
      expect(m.next(-10).toString(), '2022年12月');
      expect(m.next(24).toString(), '2025年10月');
      expect(m.next(-24).toString(), '2021年10月');
    });
  });
}
