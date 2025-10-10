import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 农历周测试
///
/// Author: 6tail
void main() {
  group('LunarWeek Tests', () {
    test('test1 - 农历周名称和toString', () {
      var week = LunarWeek.fromYm(2023, 1, 0, 2);
      expect(week.toString(), '农历癸卯年正月第一周');
      expect(week.getFirstDay().toString(), '农历壬寅年十二月廿六');
    });

    test('test2 - 第一周的第一天', () {
      var week = LunarWeek.fromYm(2023, 1, 0, 2);
      var firstDay = week.getFirstDay();
      expect(firstDay.month.year.getYear(), 2022); // 第一周可能从上个月开始
      expect(firstDay.month.getMonth(), 12);
      expect(firstDay.getDay(), 26);
    });

    test('test3 - 推移2周', () {
      var week = LunarWeek.fromYm(2024, 6, 0, 0);
      expect(week.toString(), '农历甲辰年六月第一周');
      expect(week.next(2).toString(), '农历甲辰年六月第三周');
    });

    test('test4 - 推移跨月（向前）', () {
      var week = LunarWeek.fromYm(2024, 6, 0, 0);
      expect(week.next(5).toString(), '农历甲辰年七月第一周');
    });

    test('test5 - 推移跨月（向后）', () {
      var week = LunarWeek.fromYm(2024, 6, 0, 0);
      expect(week.next(-1).toString(), '农历甲辰年五月第四周');
    });

    test('test6 - 向后推移多周', () {
      var week = LunarWeek.fromYm(2024, 6, 0, 0);
      expect(week.next(-4).toString(), '农历甲辰年五月第一周');
    });

    test('test7 - 获取周索引', () {
      var week = LunarWeek.fromYm(2023, 1, 0, 2);
      expect(week.getIndex(), 0); // 第一周索引为0
    });

    test('test8 - 获取周索引（第二周）', () {
      var week = LunarWeek.fromYm(2023, 1, 1, 2);
      expect(week.getIndex(), 1);
    });

    test('test9 - 获取周名称', () {
      var week = LunarWeek.fromYm(2023, 1, 0, 0);
      expect(week.getName(), '第一周');
    });

    test('test10 - 获取月份', () {
      var week = LunarWeek.fromYm(2023, 1, 0, 0);
      expect(week.month.getMonth(), 1);
      expect(week.month.year.getYear(), 2023);
    });

    test('test11 - 获取起始星期', () {
      var week = LunarWeek.fromYm(2023, 1, 0, 0);
      expect(week.start.getIndex(), 0); // 周日开始
    });

    test('test12 - 周一开始', () {
      var week = LunarWeek.fromYm(2023, 1, 0, 1);
      expect(week.start.getIndex(), 1);
    });

    test('test13 - 获取所有天', () {
      var week = LunarWeek.fromYm(2023, 1, 0, 0);
      var days = week.getDays();
      expect(days.length, greaterThan(0));
      expect(days.length, lessThanOrEqualTo(7));
    });

    test('test14 - 推移循环', () {
      var week = LunarWeek.fromYm(2023, 5, 2, 0);
      var next = week.next(1);
      var prev = next.next(-1);
      expect(prev.getIndex(), week.getIndex());
    });

    test('test15 - 跨年推移', () {
      var week = LunarWeek.fromYm(2023, 12, 3, 0); // 十二月第四周
      var next = week.next(2);
      expect(next.month.year.getYear(), greaterThanOrEqualTo(2023));
    });
  });
}
