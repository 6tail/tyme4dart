import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 农历传统节日测试
void main() {
  group('LunarFestival Tests', () {
    test('test0 - 遍历所有农历节日名称', () {
      for (int i = 0; i < LunarFestival.names.length; i++) {
        LunarFestival? f = LunarFestival.fromIndex(2023, i);
        expect(f, isNotNull);
        expect(f!.getName(), equals(LunarFestival.names[i]));
      }
    });

    test('test1 - 从第一个节日推移到所有节日', () {
      LunarFestival? f = LunarFestival.fromIndex(2023, 0);
      expect(f, isNotNull);
      for (int i = 0; i < LunarFestival.names.length; i++) {
        expect(f!.next(i).getName(), equals(LunarFestival.names[i]));
      }
    });

    test('test2 - 春节推移测试', () {
      LunarFestival? f = LunarFestival.fromIndex(2023, 0);
      expect(f, isNotNull);
      expect(f.toString(), equals('农历癸卯年正月初一 春节'));
      expect(f!.next(10).toString(), equals('农历癸卯年十一月初十 冬至节'));
      expect(f.next(13).toString(), equals('农历甲辰年正月初一 春节'));
      expect(f.next(-3).toString(), equals('农历壬寅年十一月廿九 冬至节'));
    });

    test('test3 - 负向推移到清明节', () {
      LunarFestival? f = LunarFestival.fromIndex(2023, 0);
      expect(f, isNotNull);
      expect(f!.next(-9).toString(), equals('农历壬寅年三月初五 清明节'));
    });

    test('test4 - 从农历日获取元宵节', () {
      LunarFestival? f = LunarDay.fromYmd(2010, 1, 15).getFestival();
      expect(f, isNotNull);
      expect(f.toString(), equals('农历庚寅年正月十五 元宵节'));
    });

    test('test5 - 从农历日获取除夕', () {
      LunarFestival? f = LunarDay.fromYmd(2021, 12, 29).getFestival();
      expect(f, isNotNull);
      expect(f.toString(), equals('农历辛丑年十二月廿九 除夕'));
    });

    test('test6 - 从公历日转农历获取冬至节', () {
      LunarFestival? f = SolarDay.fromYmd(2025, 12, 21).getLunarDay().getFestival();
      expect(f, isNotNull);
      expect(f.toString(), equals('农历乙巳年十一月初二 冬至节'));
    });

    test('test7 - 从农历日获取端午节', () {
      LunarFestival? f = LunarDay.fromYmd(2025, 5, 5).getFestival();
      expect(f, isNotNull);
      expect(f.toString(), equals('农历乙巳年五月初五 端午节'));
    });
  });
}
