import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 农历月测试
///
/// Author: 6tail
void main() {
  group('LunarMonth Tests', () {
    test('test0 - 月份名称', () {
      expect(LunarMonth.fromYm(2359, 7).getName(), '七月');
    });

    test('test1 - 闰月名称', () {
      expect(LunarMonth.fromYm(2359, -7).getName(), '闰七月');
    });

    test('test2 - 2023年6月天数', () {
      expect(LunarMonth.fromYm(2023, 6).getDayCount(), 29);
    });

    test('test3 - 2023年7月天数', () {
      expect(LunarMonth.fromYm(2023, 7).getDayCount(), 30);
    });

    test('test4 - 2023年8月天数', () {
      expect(LunarMonth.fromYm(2023, 8).getDayCount(), 30);
    });

    test('test5 - 2023年9月天数', () {
      expect(LunarMonth.fromYm(2023, 9).getDayCount(), 29);
    });

    test('test6 - 初一对应公历', () {
      expect(LunarMonth.fromYm(2023, 9).getFirstJulianDay().getSolarDay().toString(), '2023年10月15日');
    });

    test('test7 - 2023年正月干支', () {
      expect(LunarMonth.fromYm(2023, 1).getSixtyCycle().getName(), '甲寅');
    });

    test('test8 - 2023年闰2月干支', () {
      expect(LunarMonth.fromYm(2023, -2).getSixtyCycle().getName(), '乙卯');
    });

    test('test9 - 2023年3月干支', () {
      expect(LunarMonth.fromYm(2023, 3).getSixtyCycle().getName(), '丙辰');
    });

    test('test10 - 2024年正月干支', () {
      expect(LunarMonth.fromYm(2024, 1).getSixtyCycle().getName(), '丙寅');
    });

    test('test11 - 2023年12月干支', () {
      expect(LunarMonth.fromYm(2023, 12).getSixtyCycle().getName(), '乙丑');
    });

    test('test12 - 2022年正月干支', () {
      expect(LunarMonth.fromYm(2022, 1).getSixtyCycle().getName(), '壬寅');
    });

    test('test13 - 37年闰12月', () {
      expect(LunarMonth.fromYm(37, -12).getName(), '闰十二月');
    });

    test('test14 - 5552年闰12月', () {
      expect(LunarMonth.fromYm(5552, -12).getName(), '闰十二月');
    });

    test('test15 - 推移1个月', () {
      expect(LunarMonth.fromYm(2008, 11).next(1).toString(), '农历戊子年十二月');
    });

    test('test16 - 推移2个月（跨年）', () {
      expect(LunarMonth.fromYm(2008, 11).next(2).toString(), '农历己丑年正月');
    });

    test('test17 - 推移6个月', () {
      expect(LunarMonth.fromYm(2008, 11).next(6).toString(), '农历己丑年五月');
    });

    test('test18 - 推移7个月（跨闰月）', () {
      expect(LunarMonth.fromYm(2008, 11).next(7).toString(), '农历己丑年闰五月');
    });

    test('test19 - 推移8个月', () {
      expect(LunarMonth.fromYm(2008, 11).next(8).toString(), '农历己丑年六月');
    });

    test('test20 - 推移15个月', () {
      expect(LunarMonth.fromYm(2008, 11).next(15).toString(), '农历庚寅年正月');
    });

    test('test21 - 向后推移1个月', () {
      expect(LunarMonth.fromYm(2008, 12).next(-1).toString(), '农历戊子年十一月');
    });

    test('test22 - 向后推移2个月（跨年）', () {
      expect(LunarMonth.fromYm(2009, 1).next(-2).toString(), '农历戊子年十一月');
    });

    test('test23 - 向后推移6个月', () {
      expect(LunarMonth.fromYm(2009, 5).next(-6).toString(), '农历戊子年十一月');
    });

    test('test24 - 向后推移7个月（跨闰月）', () {
      expect(LunarMonth.fromYm(2009, -5).next(-7).toString(), '农历戊子年十一月');
    });

    test('test25 - 向后推移8个月', () {
      expect(LunarMonth.fromYm(2009, 6).next(-8).toString(), '农历戊子年十一月');
    });

    test('test26 - 向后推移15个月', () {
      expect(LunarMonth.fromYm(2010, 1).next(-15).toString(), '农历戊子年十一月');
    });

    test('test27 - 2012年闰4月天数', () {
      expect(LunarMonth.fromYm(2012, -4).getDayCount(), 29);
    });

    test('test28 - 2023年9月干支', () {
      expect(LunarMonth.fromYm(2023, 9).getSixtyCycle().toString(), '壬戌');
    });

    test('test29 - 2023-10-07 干支月测试', () {
      SolarDay solarDay = SolarDay.fromYmd(2023, 10, 7);
      LunarDay lunarDay = solarDay.getLunarDay();
      expect(lunarDay.month.getSixtyCycle().toString(), '辛酉');
      expect(lunarDay.getSixtyCycleDay().getMonth().toString(), '辛酉');
      expect(solarDay.getSixtyCycleDay().getMonth().toString(), '辛酉');
    });

    test('test30 - 2023-10-08 干支月测试', () {
      SolarDay solarDay = SolarDay.fromYmd(2023, 10, 8);
      LunarDay lunarDay = solarDay.getLunarDay();
      expect(lunarDay.month.getSixtyCycle().toString(), '辛酉');
      expect(lunarDay.getSixtyCycleDay().getMonth().toString(), '壬戌');
      expect(solarDay.getSixtyCycleDay().getMonth().toString(), '壬戌');
    });

    test('test31 - 2023-10-15 农历月测试', () {
      SolarDay solarDay = SolarDay.fromYmd(2023, 10, 15);
      LunarDay lunarDay = solarDay.getLunarDay();
      expect(lunarDay.month.getName(), '九月');
      expect(lunarDay.month.getSixtyCycle().toString(), '壬戌');
      expect(lunarDay.getSixtyCycleDay().getMonth().toString(), '壬戌');
      expect(solarDay.getSixtyCycleDay().getMonth().toString(), '壬戌');
    });

    test('test32 - 2023-11-07 干支月测试', () {
      SolarDay solarDay = SolarDay.fromYmd(2023, 11, 7);
      LunarDay lunarDay = solarDay.getLunarDay();
      expect(lunarDay.month.getSixtyCycle().toString(), '壬戌');
      expect(lunarDay.getSixtyCycleDay().getMonth().toString(), '壬戌');
      expect(solarDay.getSixtyCycleDay().getMonth().toString(), '壬戌');
    });

    test('test33 - 2023-11-08 干支月测试', () {
      SolarDay solarDay = SolarDay.fromYmd(2023, 11, 8);
      LunarDay lunarDay = solarDay.getLunarDay();
      expect(lunarDay.month.getSixtyCycle().toString(), '壬戌');
      expect(lunarDay.getSixtyCycleDay().getMonth().toString(), '癸亥');
      expect(solarDay.getSixtyCycleDay().getMonth().toString(), '癸亥');
    });

    test('test34 - 2023年12月向后推移（跨闰月）', () {
      // 2023年闰2月
      LunarMonth m = LunarMonth.fromYm(2023, 12);
      expect(m.toString(), '农历癸卯年十二月');
      expect(m.next(-1).toString(), '农历癸卯年十一月');
      expect(m.next(-2).toString(), '农历癸卯年十月');
    });

    test('test35 - 2023年3月向后推移（跨闰月）', () {
      // 2023年闰2月
      LunarMonth m = LunarMonth.fromYm(2023, 3);
      expect(m.toString(), '农历癸卯年三月');
      expect(m.next(-1).toString(), '农历癸卯年闰二月');
      expect(m.next(-2).toString(), '农历癸卯年二月');
      expect(m.next(-3).toString(), '农历癸卯年正月');
      expect(m.next(-4).toString(), '农历壬寅年十二月');
      expect(m.next(-5).toString(), '农历壬寅年十一月');
    });

    test('test36 - 1983-02-15 干支月测试', () {
      SolarDay solarDay = SolarDay.fromYmd(1983, 2, 15);
      LunarDay lunarDay = solarDay.getLunarDay();
      expect(lunarDay.month.getSixtyCycle().toString(), '甲寅');
      expect(lunarDay.getSixtyCycleDay().getMonth().toString(), '甲寅');
      expect(solarDay.getSixtyCycleDay().getMonth().toString(), '甲寅');
    });

    test('test37 - 2023-10-30 干支月测试', () {
      SolarDay solarDay = SolarDay.fromYmd(2023, 10, 30);
      LunarDay lunarDay = solarDay.getLunarDay();
      expect(lunarDay.month.getSixtyCycle().toString(), '壬戌');
      expect(lunarDay.getSixtyCycleDay().getMonth().toString(), '壬戌');
      expect(solarDay.getSixtyCycleDay().getMonth().toString(), '壬戌');
    });

    test('test38 - 2023-10-19 干支月测试', () {
      SolarDay solarDay = SolarDay.fromYmd(2023, 10, 19);
      LunarDay lunarDay = solarDay.getLunarDay();
      expect(lunarDay.month.getSixtyCycle().toString(), '壬戌');
      expect(lunarDay.getSixtyCycleDay().getMonth().toString(), '壬戌');
      expect(solarDay.getSixtyCycleDay().getMonth().toString(), '壬戌');
    });

    test('test39 - 2023年11月干支', () {
      LunarMonth m = LunarMonth.fromYm(2023, 11);
      expect(m.toString(), '农历癸卯年十一月');
      expect(m.getSixtyCycle().toString(), '甲子');
    });

    test('test40 - 2018-06-26 干支月测试', () {
      expect(LunarDay.fromYmd(2018, 6, 26).month.getSixtyCycle().toString(), '己未');
      expect(LunarDay.fromYmd(2018, 6, 26).getSixtyCycleDay().getMonth().toString(), '庚申');
    });

    test('test41 - 1991年12月干支', () {
      expect(LunarMonth.fromYm(1991, 12).getSixtyCycle().toString(), '辛丑');
    });

    test('test42 - 1991年3月月小人', () {
      expect(LunarMonth.fromYm(1991, 3).getMinorRen().getName(), '速喜');
    });
  });
}
