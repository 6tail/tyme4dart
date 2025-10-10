import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 农历日测试
/// 
/// Author: 6tail
void main() {
  group('LunarDay Tests', () {
    test('test1 - 极早日期（0年11月18日）', () {
      expect(LunarDay.fromYmd(0, 11, 18).getSolarDay().toString(), '1年1月1日');
    });

    test('test2 - 极晚日期（9999年12月2日）', () {
      expect(LunarDay.fromYmd(9999, 12, 2).getSolarDay().toString(), '9999年12月31日');
    });

    test('test3 - 1905年正月初一', () {
      expect(LunarDay.fromYmd(1905, 1, 1).getSolarDay().toString(), '1905年2月4日');
    });

    test('test4 - 2038年12月29日', () {
      expect(LunarDay.fromYmd(2038, 12, 29).getSolarDay().toString(), '2039年1月23日');
    });

    test('test5 - 1500年正月初一', () {
      expect(LunarDay.fromYmd(1500, 1, 1).getSolarDay().toString(), '1500年1月31日');
    });

    test('test6 - 1500年12月29日', () {
      expect(LunarDay.fromYmd(1500, 12, 29).getSolarDay().toString(), '1501年1月18日');
    });

    test('test7 - 1582年9月18日', () {
      expect(LunarDay.fromYmd(1582, 9, 18).getSolarDay().toString(), '1582年10月4日');
    });

    test('test8 - 1582年9月19日', () {
      expect(LunarDay.fromYmd(1582, 9, 19).getSolarDay().toString(), '1582年10月15日');
    });

    test('test9 - 2019年12月12日', () {
      expect(LunarDay.fromYmd(2019, 12, 12).getSolarDay().toString(), '2020年1月6日');
    });

    test('test10 - 2033年闰11月初一', () {
      expect(LunarDay.fromYmd(2033, -11, 1).getSolarDay().toString(), '2033年12月22日');
    });

    test('test11 - 2021年6月7日', () {
      expect(LunarDay.fromYmd(2021, 6, 7).getSolarDay().toString(), '2021年7月16日');
    });

    test('test12 - 2034年正月初一', () {
      expect(LunarDay.fromYmd(2034, 1, 1).getSolarDay().toString(), '2034年2月19日');
    });

    test('test13 - 2033年12月初一', () {
      expect(LunarDay.fromYmd(2033, 12, 1).getSolarDay().toString(), '2034年1月20日');
    });

    test('test14 - 7013年闰11月初四', () {
      expect(LunarDay.fromYmd(7013, -11, 4).getSolarDay().toString(), '7013年12月24日');
    });

    test('test15 - 2023年8月24日干支', () {
      expect(LunarDay.fromYmd(2023, 8, 24).getSixtyCycle().toString(), '己亥');
    });

    test('test16 - 1653年正月初六干支', () {
      expect(LunarDay.fromYmd(1653, 1, 6).getSixtyCycle().toString(), '癸酉');
    });

    test('test17 - 推移31天', () {
      expect(LunarDay.fromYmd(2010, 1, 1).next(31).toString(), '农历庚寅年二月初二');
    });

    test('test18 - 推移60天（跨闰月）', () {
      expect(LunarDay.fromYmd(2012, 3, 1).next(60).toString(), '农历壬辰年闰四月初一');
    });

    test('test19 - 推移88天', () {
      expect(LunarDay.fromYmd(2012, 3, 1).next(88).toString(), '农历壬辰年闰四月廿九');
    });

    test('test20 - 推移89天', () {
      expect(LunarDay.fromYmd(2012, 3, 1).next(89).toString(), '农历壬辰年五月初一');
    });

    test('test21 - 2020年4月初一', () {
      expect(LunarDay.fromYmd(2020, 4, 1).getSolarDay().toString(), '2020年4月23日');
    });

    test('test22 - 2024年正月初一农历年干支', () {
      expect(LunarDay.fromYmd(2024, 1, 1).month.year.getSixtyCycle().getName(), '甲辰');
    });

    test('test23 - 2023年12月30日农历年干支', () {
      expect(LunarDay.fromYmd(2023, 12, 30).month.year.getSixtyCycle().getName(), '癸卯');
    });

    test('test24 - 二十八宿（2020年4月13日）', () {
      var d = LunarDay.fromYmd(2020, 4, 13);
      var star = d.getTwentyEightStar();
      expect(star.getZone().getName(), '南');
      expect(star.getZone().getBeast().getName(), '朱雀');
      expect(star.getName(), '翼');
      expect(star.getSevenStar().getName(), '火');
      expect(star.getAnimal().getName(), '蛇');
      expect(star.getLuck().getName(), '凶');
      expect(star.getLand().getName(), '阳天');
      expect(star.getLand().getDirection().getName(), '东南');
    });

    test('test25 - 二十八宿（2023年9月28日）', () {
      var d = LunarDay.fromYmd(2023, 9, 28);
      var star = d.getTwentyEightStar();
      expect(star.getZone().getName(), '南');
      expect(star.getZone().getBeast().getName(), '朱雀');
      expect(star.getName(), '柳');
      expect(star.getSevenStar().getName(), '土');
      expect(star.getAnimal().getName(), '獐');
      expect(star.getLuck().getName(), '凶');
      expect(star.getLand().getName(), '炎天');
      expect(star.getLand().getDirection().getName(), '南');
    });

    test('test26 - 2005年11月23日 干支月测试', () {
      LunarDay lunar = LunarDay.fromYmd(2005, 11, 23);
      expect(lunar.month.getSixtyCycle().getName(), '戊子');
      expect(lunar.getSixtyCycleDay().getMonth().getName(), '戊子');
    });

    test('test27 - 推移31天', () {
      LunarDay lunar = LunarDay.fromYmd(2024, 1, 1);
      expect(lunar.next(31).toString(), '农历甲辰年二月初三');
    });

    test('test28 - 2024年3月5日日小人', () {
      LunarDay lunar = LunarDay.fromYmd(2024, 3, 5);
      expect(lunar.getMinorRen().getName(), '大安');
    });
  });
}

