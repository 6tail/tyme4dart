import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 公历周测试
///
/// Author: 6tail
void main() {
  group('SolarWeek Tests', () {
    test('test0 - 1582年10月1日星期', () {
      expect(SolarDay.fromYmd(1582, 10, 1).getWeek().getName(), '一');
    });

    test('test1 - 1582年10月15日星期', () {
      expect(SolarDay.fromYmd(1582, 10, 15).getWeek().getName(), '五');
    });

    test('test2 - 星期索引', () {
      expect(SolarDay.fromYmd(2023, 10, 31).getWeek().getIndex(), 2);
    });

    test('test3 - 第一周', () {
      var w = SolarWeek.fromYm(2023, 10, 0, 0);
      expect(w.getName(), '第一周');
      expect(w.toString(), '2023年10月第一周');
    });

    test('test5 - 第五周', () {
      var w = SolarWeek.fromYm(2023, 10, 4, 0);
      expect(w.getName(), '第五周');
      expect(w.toString(), '2023年10月第五周');
    });

    test('test6 - 第六周（周一开始）', () {
      var w = SolarWeek.fromYm(2023, 10, 5, 1);
      expect(w.getName(), '第六周');
      expect(w.toString(), '2023年10月第六周');
    });

    test('test7 - 推移4周', () {
      var w = SolarWeek.fromYm(2023, 10, 0, 0).next(4);
      expect(w.getName(), '第五周');
      expect(w.toString(), '2023年10月第五周');
    });

    test('test8 - 推移跨月', () {
      var w = SolarWeek.fromYm(2023, 10, 0, 0).next(5);
      expect(w.getName(), '第二周');
      expect(w.toString(), '2023年11月第二周');
    });

    test('test9 - 向后推移1周', () {
      var w = SolarWeek.fromYm(2023, 10, 0, 0).next(-1);
      expect(w.getName(), '第五周');
      expect(w.toString(), '2023年9月第五周');
    });

    test('test10 - 向后推移5周', () {
      var w = SolarWeek.fromYm(2023, 10, 0, 0).next(-5);
      expect(w.getName(), '第一周');
      expect(w.toString(), '2023年9月第一周');
    });

    test('test11 - 向后推移6周', () {
      var w = SolarWeek.fromYm(2023, 10, 0, 0).next(-6);
      expect(w.getName(), '第四周');
      expect(w.toString(), '2023年8月第四周');
    });

    test('test12 - 1582年10月1日星期索引', () {
      var solar = SolarDay.fromYmd(1582, 10, 1);
      expect(solar.getWeek().getIndex(), 1);
    });

    test('test13 - 1582年10月15日星期索引', () {
      var solar = SolarDay.fromYmd(1582, 10, 15);
      expect(solar.getWeek().getIndex(), 5);
    });

    test('test14 - 1129年11月17日星期', () {
      var solar = SolarDay.fromYmd(1129, 11, 17);
      expect(solar.getWeek().getIndex(), 0);
    });

    test('test15 - 1129年11月1日星期', () {
      var solar = SolarDay.fromYmd(1129, 11, 1);
      expect(solar.getWeek().getIndex(), 5);
    });

    test('test16 - 8年11月1日星期', () {
      var solar = SolarDay.fromYmd(8, 11, 1);
      expect(solar.getWeek().getIndex(), 4);
    });

    test('test17 - 1582年9月30日星期', () {
      var solar = SolarDay.fromYmd(1582, 9, 30);
      expect(solar.getWeek().getIndex(), 0);
    });

    test('test18 - 1582年1月1日星期', () {
      var solar = SolarDay.fromYmd(1582, 1, 1);
      expect(solar.getWeek().getIndex(), 1);
    });

    test('test19 - 1500年2月29日星期', () {
      var solar = SolarDay.fromYmd(1500, 2, 29);
      expect(solar.getWeek().getIndex(), 6);
    });

    test('test20 - 9865年7月26日星期', () {
      var solar = SolarDay.fromYmd(9865, 7, 26);
      expect(solar.getWeek().getIndex(), 3);
    });

    test('test22 - 公历周第一天', () {
      var week = SolarWeek.fromYm(2023, 1, 0, 2);
      expect(week.toString(), '2023年1月第一周');
      expect(week.getFirstDay().toString(), '2022年12月27日');
    });

    test('test24 - 公历周在年内索引和日期获取周', () {
      int start = 0;
      var week = SolarWeek.fromYm(2024, 2, 2, start);
      expect(week.toString(), '2024年2月第三周');
      expect(week.getIndexInYear(), 6);

      week = SolarDay.fromYmd(2024, 2, 11).getSolarWeek(start);
      expect(week.toString(), '2024年2月第三周');

      week = SolarDay.fromYmd(2024, 2, 17).getSolarWeek(start);
      expect(week.toString(), '2024年2月第三周');

      week = SolarDay.fromYmd(2024, 2, 10).getSolarWeek(start);
      expect(week.toString(), '2024年2月第二周');

      week = SolarDay.fromYmd(2024, 2, 18).getSolarWeek(start);
      expect(week.toString(), '2024年2月第四周');
    });

    test('test26 - 公历周第一天跨月', () {
      var week = SolarDay.fromYmd(2025, 3, 6).getSolarWeek(0);
      expect(week.toString(), '2025年3月第二周');
      expect(week.getFirstDay().toString(), '2025年3月2日');
    });
  });
}
