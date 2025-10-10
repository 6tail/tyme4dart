import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 公历日测试
///
/// Author: 6tail
void main() {
  group('SolarDay Tests', () {
    test('test0 - 日期名称', () {
      expect(SolarDay.fromYmd(2023, 1, 1).getName(), '1日');
      expect(SolarDay.fromYmd(2023, 1, 1).toString(), '2023年1月1日');
    });

    test('test1 - 闰年2月29日', () {
      expect(SolarDay.fromYmd(2000, 2, 29).getName(), '29日');
      expect(SolarDay.fromYmd(2000, 2, 29).toString(), '2000年2月29日');
    });

    test('test2 - 年内索引', () {
      expect(SolarDay.fromYmd(2023, 1, 1).getIndexInYear(), 0);
      expect(SolarDay.fromYmd(2023, 12, 31).getIndexInYear(), 364);
      expect(SolarDay.fromYmd(2020, 12, 31).getIndexInYear(), 365);
    });

    test('test3 - 日期相减', () {
      expect(SolarDay.fromYmd(2023, 1, 1).subtract(SolarDay.fromYmd(2023, 1, 1)), 0);
      expect(SolarDay.fromYmd(2023, 1, 2).subtract(SolarDay.fromYmd(2023, 1, 1)), 1);
      expect(SolarDay.fromYmd(2023, 1, 1).subtract(SolarDay.fromYmd(2023, 1, 2)), -1);
      expect(SolarDay.fromYmd(2023, 2, 1).subtract(SolarDay.fromYmd(2023, 1, 1)), 31);
      expect(SolarDay.fromYmd(2023, 1, 1).subtract(SolarDay.fromYmd(2023, 2, 1)), -31);
      expect(SolarDay.fromYmd(2024, 1, 1).subtract(SolarDay.fromYmd(2023, 1, 1)), 365);
      expect(SolarDay.fromYmd(2023, 1, 1).subtract(SolarDay.fromYmd(2024, 1, 1)), -365);
      expect(SolarDay.fromYmd(1582, 10, 15).subtract(SolarDay.fromYmd(1582, 10, 4)), 1);
    });

    test('test4 - 1582年10月跳跃', () {
      expect(SolarDay.fromYmd(1582, 10, 15).next(-1).toString(), '1582年10月4日');
    });

    test('test5 - 跨月推移', () {
      expect(SolarDay.fromYmd(2000, 2, 28).next(2).toString(), '2000年3月1日');
    });

    test('test6 - 公历转农历', () {
      expect(SolarDay.fromYmd(2020, 5, 24).getLunarDay().toString(), '农历庚子年闰四月初二');
    });

    test('test7 - 日期相减（跨月）', () {
      expect(SolarDay.fromYmd(2020, 5, 24).subtract(SolarDay.fromYmd(2020, 4, 23)), 31);
    });

    test('test8 - 极早年份', () {
      expect(SolarDay.fromYmd(16, 11, 30).getLunarDay().toString(), '农历丙子年十一月十二');
    });

    test('test9 - 获取节气', () {
      expect(SolarDay.fromYmd(2023, 10, 27).getTerm().toString(), '霜降');
    });

    test('test10 - 获取物候', () {
      expect(SolarDay.fromYmd(2023, 10, 27).getPhenologyDay().toString(), '豺乃祭兽第4天');
    });

    test('test11 - 获取三候', () {
      expect(SolarDay.fromYmd(2023, 10, 27).getPhenologyDay().getPhenology().getThreePhenology().toString(), '初候');
    });

    test('test22 - 立春后农历年干支', () {
      expect(SolarDay.fromYmd(2024, 2, 10).getLunarDay().month.year.getSixtyCycle().getName(), '甲辰');
    });

    test('test23 - 立春前农历年干支', () {
      expect(SolarDay.fromYmd(2024, 2, 9).getLunarDay().month.year.getSixtyCycle().getName(), '癸卯');
    });

    test('test24 - 农历年跨度', () {
      var prev = LunarDay.fromYmd(2025, 1, 1).getSolarDay();
      var next = LunarDay.fromYmd(2026, 1, 1).getSolarDay();
      var today = SolarDay.fromYmd(2025, 2, 17);
      expect(prev.toString(), '2025年1月29日');
      expect(next.toString(), '2026年2月17日');
      expect(next.subtract(prev), 384);
      expect(next.subtract(today), 365);
    });
  });
}
