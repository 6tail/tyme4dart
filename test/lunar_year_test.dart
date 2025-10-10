import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 农历年测试
///
/// Author: 6tail
void main() {
  group('LunarYear Tests', () {
    test('test0 - 农历年名称', () {
      expect(LunarYear.fromYear(2023).getName(), '农历癸卯年');
    });

    test('test1 - 向前推移5年', () {
      expect(LunarYear.fromYear(2023).next(5).getName(), '农历戊申年');
    });

    test('test2 - 向后推移5年', () {
      expect(LunarYear.fromYear(2023).next(-5).getName(), '农历戊戌年');
    });

    test('test3 - 农历年的干支', () {
      expect(LunarYear.fromYear(2020).getSixtyCycle().getName(), '庚子');
    });

    test('test4 - 农历年的生肖', () {
      expect(LunarYear.fromYear(1986).getSixtyCycle().getEarthBranch().getZodiac().getName(), '虎');
    });

    test('test5 - 闰月（151年闰12月）', () {
      expect(LunarYear.fromYear(151).getLeapMonth(), 12);
    });

    test('test6 - 闰月（2357年闰1月）', () {
      expect(LunarYear.fromYear(2357).getLeapMonth(), 1);
    });

    test('test7 - 2023年干支和生肖', () {
      var y = LunarYear.fromYear(2023);
      expect(y.getSixtyCycle().getName(), '癸卯');
      expect(y.getSixtyCycle().getEarthBranch().getZodiac().getName(), '兔');
    });

    test('test8 - 1864年三元九运（上元）', () {
      expect(LunarYear.fromYear(1864).getTwenty().getSixty().getName(), '上元');
    });

    test('test9 - 1923年三元九运（上元）', () {
      expect(LunarYear.fromYear(1923).getTwenty().getSixty().getName(), '上元');
    });

    test('test10 - 1924年三元九运（中元）', () {
      expect(LunarYear.fromYear(1924).getTwenty().getSixty().getName(), '中元');
    });

    test('test11 - 1983年三元九运（中元）', () {
      expect(LunarYear.fromYear(1983).getTwenty().getSixty().getName(), '中元');
    });

    test('test12 - 1984年三元九运（下元）', () {
      expect(LunarYear.fromYear(1984).getTwenty().getSixty().getName(), '下元');
    });

    test('test13 - 2043年三元九运（下元）', () {
      expect(LunarYear.fromYear(2043).getTwenty().getSixty().getName(), '下元');
    });

    test('test14 - 1864年一运', () {
      expect(LunarYear.fromYear(1864).getTwenty().getName(), '一运');
    });

    test('test15 - 1883年一运', () {
      expect(LunarYear.fromYear(1883).getTwenty().getName(), '一运');
    });

    test('test16 - 1884年二运', () {
      expect(LunarYear.fromYear(1884).getTwenty().getName(), '二运');
    });

    test('test17 - 1903年二运', () {
      expect(LunarYear.fromYear(1903).getTwenty().getName(), '二运');
    });

    test('test18 - 1904年三运', () {
      expect(LunarYear.fromYear(1904).getTwenty().getName(), '三运');
    });

    test('test19 - 1923年三运', () {
      expect(LunarYear.fromYear(1923).getTwenty().getName(), '三运');
    });

    test('test20 - 2004年八运', () {
      expect(LunarYear.fromYear(2004).getTwenty().getName(), '八运');
    });

    test('test21 - 1年（六运、中元）', () {
      var year = LunarYear.fromYear(1);
      expect(year.getTwenty().getName(), '六运');
      expect(year.getTwenty().getSixty().getName(), '中元');
    });

    test('test22 - 1863年（九运、下元）', () {
      var year = LunarYear.fromYear(1863);
      expect(year.getTwenty().getName(), '九运');
      expect(year.getTwenty().getSixty().getName(), '下元');
    });

    test('test23 - 获取所有月份', () {
      var year = LunarYear.fromYear(2023);
      var months = year.getMonths();
      expect(months.length, 13); // 2023年有闰2月，共13个月
      expect(months[0].getMonth(), 1);
      expect(months[1].getMonth(), 2);
      expect(months[2].getMonth(), 2); // 闰2月的getMonth()也返回2
      expect(months[2].isLeap(), true); // 通过isLeap()判断是否为闰月
      expect(months[12].getMonth(), 12);
    });

    test('test24 - toString格式', () {
      expect(LunarYear.fromYear(2023).toString(), '农历癸卯年');
    });

    test('test25 - 获取年份值', () {
      expect(LunarYear.fromYear(2023).getYear(), 2023);
    });
  });
}
