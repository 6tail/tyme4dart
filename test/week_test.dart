import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 星期测试
///
/// Author: 6tail
void main() {
  group('Week Tests', () {
    test('test0 - 1582年10月1日星期', () {
      expect(SolarDay.fromYmd(1582, 10, 1).getWeek().getName(), equals('一'));
    });

    test('test1 - 1582年10月15日星期', () {
      expect(SolarDay.fromYmd(1582, 10, 15).getWeek().getName(), equals('五'));
    });

    test('test2 - 2023年10月31日星期索引', () {
      expect(SolarDay.fromYmd(2023, 10, 31).getWeek().getIndex(), equals(2));
    });

    test('test3 - 2023年10月第一周', () {
      SolarWeek w = SolarWeek.fromYm(2023, 10, 0, 0);
      expect(w.getName(), equals('第一周'));
      expect(w.toString(), equals('2023年10月第一周'));
    });

    test('test5 - 2023年10月第五周', () {
      SolarWeek w = SolarWeek.fromYm(2023, 10, 4, 0);
      expect(w.getName(), equals('第五周'));
      expect(w.toString(), equals('2023年10月第五周'));
    });

    test('test6 - 2023年10月第六周（周一开始）', () {
      SolarWeek w = SolarWeek.fromYm(2023, 10, 5, 1);
      expect(w.getName(), equals('第六周'));
      expect(w.toString(), equals('2023年10月第六周'));
    });

    test('test7 - 周推移（+4周）', () {
      SolarWeek w = SolarWeek.fromYm(2023, 10, 0, 0).next(4);
      expect(w.getName(), equals('第五周'));
      expect(w.toString(), equals('2023年10月第五周'));
    });

    test('test8 - 周推移跨月（+5周）', () {
      SolarWeek w = SolarWeek.fromYm(2023, 10, 0, 0).next(5);
      expect(w.getName(), equals('第二周'));
      expect(w.toString(), equals('2023年11月第二周'));
    });

    test('test9 - 周推移（-1周）', () {
      SolarWeek w = SolarWeek.fromYm(2023, 10, 0, 0).next(-1);
      expect(w.getName(), equals('第五周'));
      expect(w.toString(), equals('2023年9月第五周'));
    });

    test('test10 - 周推移（-5周）', () {
      SolarWeek w = SolarWeek.fromYm(2023, 10, 0, 0).next(-5);
      expect(w.getName(), equals('第一周'));
      expect(w.toString(), equals('2023年9月第一周'));
    });

    test('test11 - 周推移（-6周）', () {
      SolarWeek w = SolarWeek.fromYm(2023, 10, 0, 0).next(-6);
      expect(w.getName(), equals('第四周'));
      expect(w.toString(), equals('2023年8月第四周'));
    });

    test('test12 - 1582年10月1日星期索引', () {
      SolarDay solar = SolarDay.fromYmd(1582, 10, 1);
      expect(solar.getWeek().getIndex(), equals(1));
    });

    test('test13 - 1582年10月15日星期索引', () {
      SolarDay solar = SolarDay.fromYmd(1582, 10, 15);
      expect(solar.getWeek().getIndex(), equals(5));
    });

    test('test14 - 1129年11月17日星期索引', () {
      SolarDay solar = SolarDay.fromYmd(1129, 11, 17);
      expect(solar.getWeek().getIndex(), equals(0));
    });

    test('test15 - 1129年11月1日星期索引', () {
      SolarDay solar = SolarDay.fromYmd(1129, 11, 1);
      expect(solar.getWeek().getIndex(), equals(5));
    });

    test('test16 - 8年11月1日星期索引', () {
      SolarDay solar = SolarDay.fromYmd(8, 11, 1);
      expect(solar.getWeek().getIndex(), equals(4));
    });

    test('test17 - 1582年9月30日星期索引', () {
      SolarDay solar = SolarDay.fromYmd(1582, 9, 30);
      expect(solar.getWeek().getIndex(), equals(0));
    });

    test('test18 - 1582年1月1日星期索引', () {
      SolarDay solar = SolarDay.fromYmd(1582, 1, 1);
      expect(solar.getWeek().getIndex(), equals(1));
    });

    test('test19 - 1500年2月29日星期索引', () {
      SolarDay solar = SolarDay.fromYmd(1500, 2, 29);
      expect(solar.getWeek().getIndex(), equals(6));
    });

    test('test20 - 9865年7月26日星期索引', () {
      SolarDay solar = SolarDay.fromYmd(9865, 7, 26);
      expect(solar.getWeek().getIndex(), equals(3));
    });

    test('test21 - 农历周（2023年正月第一周）', () {
      LunarWeek week = LunarWeek.fromYm(2023, 1, 0, 2);
      expect(week.toString(), equals('农历癸卯年正月第一周'));
      expect(week.getFirstDay().toString(), equals('农历壬寅年十二月廿六'));
    });

    test('test22 - 公历周（2023年1月第一周）', () {
      SolarWeek week = SolarWeek.fromYm(2023, 1, 0, 2);
      expect(week.toString(), equals('2023年1月第一周'));
      expect(week.getFirstDay().toString(), equals('2022年12月27日'));
    });

    test('test24 - 2024年2月周测试', () {
      int start = 0;
      SolarWeek week = SolarWeek.fromYm(2024, 2, 2, start);
      expect(week.toString(), equals('2024年2月第三周'));
      expect(week.getIndexInYear(), equals(6));

      week = SolarDay.fromYmd(2024, 2, 11).getSolarWeek(start);
      expect(week.toString(), equals('2024年2月第三周'));

      week = SolarDay.fromYmd(2024, 2, 17).getSolarWeek(start);
      expect(week.toString(), equals('2024年2月第三周'));

      week = SolarDay.fromYmd(2024, 2, 10).getSolarWeek(start);
      expect(week.toString(), equals('2024年2月第二周'));

      week = SolarDay.fromYmd(2024, 2, 18).getSolarWeek(start);
      expect(week.toString(), equals('2024年2月第四周'));
    });

    test('test25 - 农历周推移测试', () {
      LunarWeek week = LunarWeek.fromYm(2024, 6, 0, 0);
      expect(week.toString(), equals('农历甲辰年六月第一周'));
      expect(week.next(2).toString(), equals('农历甲辰年六月第三周'));
      expect(week.next(5).toString(), equals('农历甲辰年七月第一周'));
      expect(week.next(-1).toString(), equals('农历甲辰年五月第四周'));
      expect(week.next(-4).toString(), equals('农历甲辰年五月第一周'));
    });

    test('test26 - 2025年3月6日所在周', () {
      SolarWeek week = SolarDay.fromYmd(2025, 3, 6).getSolarWeek(0);
      expect(week.toString(), equals('2025年3月第二周'));
      expect(week.getFirstDay().toString(), equals('2025年3月2日'));
    });
  });
}
