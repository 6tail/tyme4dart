import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 八字测试
///
/// Author: 6tail
void main() {
  group('EightChar Tests', () {
    test('test1 - 十神', () {
      // 八字
      EightChar eightChar = EightChar.fromName('丙寅', '癸巳', '癸酉', '己未');

      // 年柱
      SixtyCycle year = eightChar.getYear();
      // 月柱
      SixtyCycle month = eightChar.getMonth();
      // 日柱
      SixtyCycle day = eightChar.getDay();
      // 时柱
      SixtyCycle hour = eightChar.getHour();

      // 日元(日主、日干)
      HeavenStem me = day.getHeavenStem();

      // 年柱天干十神
      expect(me.getTenStar(year.getHeavenStem())!.getName(), '正财');
      // 月柱天干十神
      expect(me.getTenStar(month.getHeavenStem())!.getName(), '比肩');
      // 时柱天干十神
      expect(me.getTenStar(hour.getHeavenStem())!.getName(), '七杀');

      // 年柱地支十神（本气)
      expect(me.getTenStar(year.getEarthBranch().getHideHeavenStemMain())!.getName(), '伤官');
      // 年柱地支十神（中气)
      expect(me.getTenStar(year.getEarthBranch().getHideHeavenStemMiddle()!)!.getName(), '正财');
      // 年柱地支十神（余气)
      expect(me.getTenStar(year.getEarthBranch().getHideHeavenStemResidual()!)!.getName(), '正官');

      // 日柱地支十神（本气)
      expect(me.getTenStar(day.getEarthBranch().getHideHeavenStemMain())!.getName(), '偏印');
      // 日柱地支藏干（中气)
      expect(day.getEarthBranch().getHideHeavenStemMiddle(), isNull);
      // 日柱地支藏干（余气)
      expect(day.getEarthBranch().getHideHeavenStemResidual(), isNull);

      // 指定任意天干的十神
      expect(me.getTenStar(HeavenStem.fromName('丙'))!.getName(), '正财');
    });

    test('test2 - 地势(长生十二神)', () {
      // 八字
      EightChar eightChar = EightChar.fromName('丙寅', '癸巳', '癸酉', '己未');

      // 年柱
      SixtyCycle year = eightChar.getYear();
      // 月柱
      SixtyCycle month = eightChar.getMonth();
      // 日柱
      SixtyCycle day = eightChar.getDay();
      // 时柱
      SixtyCycle hour = eightChar.getHour();

      // 日元(日主、日干)
      HeavenStem me = day.getHeavenStem();

      // 年柱地势
      expect(me.getTerrain(year.getEarthBranch()).getName(), '沐浴');
      // 月柱地势
      expect(me.getTerrain(month.getEarthBranch()).getName(), '胎');
      // 日柱地势
      expect(me.getTerrain(day.getEarthBranch()).getName(), '病');
      // 时柱地势
      expect(me.getTerrain(hour.getEarthBranch()).getName(), '墓');
    });

    test('test3 - 胎元', () {
      // 八字
      EightChar eightChar = EightChar.fromName('癸卯', '辛酉', '己亥', '癸酉');

      // 胎元
      SixtyCycle taiYuan = eightChar.getFetalOrigin();
      expect(taiYuan.getName(), '壬子');
      // 胎元纳音
      expect(taiYuan.getSound().getName(), '桑柘木');
    });

    test('test4 - 胎息', () {
      // 八字
      EightChar eightChar = EightChar.fromName('癸卯', '辛酉', '己亥', '癸酉');

      // 胎息
      SixtyCycle taiXi = eightChar.getFetalBreath();
      expect(taiXi.getName(), '甲寅');
      // 胎息纳音
      expect(taiXi.getSound().getName(), '大溪水');
    });

    test('test5 - 命宫', () {
      // 八字
      EightChar eightChar = EightChar.fromName('癸卯', '辛酉', '己亥', '癸酉');

      // 命宫
      SixtyCycle mingGong = eightChar.getOwnSign();
      expect(mingGong.getName(), '癸亥');
      // 命宫纳音
      expect(mingGong.getSound().getName(), '大海水');
    });

    test('test6 - 身宫', () {
      // 八字
      EightChar eightChar = EightChar.fromName('癸卯', '辛酉', '己亥', '癸酉');

      // 身宫
      SixtyCycle shenGong = eightChar.getBodySign();
      expect(shenGong.getName(), '己未');
      // 身宫纳音
      expect(shenGong.getSound().getName(), '天上火');
    });

    test('test7 - 地势(长生十二神)', () {
      // 八字
      EightChar eightChar = EightChar.fromName('乙酉', '戊子', '辛巳', '壬辰');

      // 日干
      HeavenStem me = eightChar.getDay().getHeavenStem();
      // 年柱地势
      expect(me.getTerrain(eightChar.getYear().getEarthBranch()).getName(), '临官');
      // 月柱地势
      expect(me.getTerrain(eightChar.getMonth().getEarthBranch()).getName(), '长生');
      // 日柱地势
      expect(me.getTerrain(eightChar.getDay().getEarthBranch()).getName(), '死');
      // 时柱地势
      expect(me.getTerrain(eightChar.getHour().getEarthBranch()).getName(), '墓');
    });

    test('test8 - 公历时刻转八字', () {
      EightChar eightChar = SolarTime.fromYmdHms(2005, 12, 23, 8, 37, 0).getLunarHour().getEightChar();
      expect(eightChar.getYear().getName(), '乙酉');
      expect(eightChar.getMonth().getName(), '戊子');
      expect(eightChar.getDay().getName(), '辛巳');
      expect(eightChar.getHour().getName(), '壬辰');
    });

    test('test9 - 公历时刻转八字', () {
      EightChar eightChar = SolarTime.fromYmdHms(1988, 2, 15, 23, 30, 0).getLunarHour().getEightChar();
      expect(eightChar.getYear().getName(), '戊辰');
      expect(eightChar.getMonth().getName(), '甲寅');
      expect(eightChar.getDay().getName(), '辛丑');
      expect(eightChar.getHour().getName(), '戊子');
    });

    test('test11 - 童限测试', () {
      ChildLimit childLimit = ChildLimit.fromSolarTime(SolarTime.fromYmdHms(2022, 3, 9, 20, 51, 0), Gender.MAN);
      expect(childLimit.getYearCount(), 8);
      expect(childLimit.getMonthCount(), 9);
      expect(childLimit.getDayCount(), 2);
      expect(childLimit.getHourCount(), 10);
      expect(childLimit.getMinuteCount(), 28);
      expect(childLimit.getEndTime().toString(), '2030年12月12日 07:19:00');
    });

    test('test12 - 童限测试', () {
      ChildLimit childLimit = ChildLimit.fromSolarTime(SolarTime.fromYmdHms(2018, 6, 11, 9, 30, 0), Gender.WOMAN);
      expect(childLimit.getYearCount(), 1);
      expect(childLimit.getMonthCount(), 9);
      expect(childLimit.getDayCount(), 10);
      expect(childLimit.getHourCount(), 1);
      expect(childLimit.getMinuteCount(), 42);
      expect(childLimit.getEndTime().toString(), '2020年3月21日 11:12:00');
    });

    test('test13 - 大运测试', () {
      // 童限
      ChildLimit childLimit = ChildLimit.fromSolarTime(SolarTime.fromYmdHms(1983, 2, 15, 20, 0, 0), Gender.WOMAN);
      // 八字
      expect(childLimit.getEightChar().toString(), '癸亥 甲寅 甲戌 甲戌');
      // 童限年数
      expect(childLimit.getYearCount(), 6);
      // 童限月数
      expect(childLimit.getMonthCount(), 2);
      // 童限日数
      expect(childLimit.getDayCount(), 18);
      // 童限结束(即开始起运)的公历时刻
      expect(childLimit.getEndTime().toString(), '1989年5月4日 18:24:00');
      // 童限开始(即出生)的农历年干支
      expect(childLimit.getStartTime().getLunarHour().getLunarDay().month.year.getSixtyCycle().getName(), '癸亥');
      // 童限结束(即开始起运)的农历年干支
      expect(childLimit.getEndTime().getLunarHour().getLunarDay().month.year.getSixtyCycle().getName(), '己巳');

      // 第1轮大运
      DecadeFortune decadeFortune = childLimit.getStartDecadeFortune();
      // 开始年龄
      expect(decadeFortune.getStartAge(), 7);
      // 结束年龄
      expect(decadeFortune.getEndAge(), 16);
      // 开始年
      expect(decadeFortune.getStartSixtyCycleYear().getYear(), 1989);
      // 结束年
      expect(decadeFortune.getEndSixtyCycleYear().getYear(), 1998);
      // 干支
      expect(decadeFortune.getName(), '乙卯');
      // 下一大运
      expect(decadeFortune.next(1).getName(), '丙辰');
      // 上一大运
      expect(decadeFortune.next(-1).getName(), '甲寅');
      // 第9轮大运
      expect(decadeFortune.next(8).getName(), '癸亥');

      // 小运
      Fortune fortune = childLimit.getStartFortune();
      // 年龄
      expect(fortune.getAge(), 7);
      // 农历年
      expect(fortune.getSixtyCycleYear().getYear(), 1989);
      // 干支
      expect(fortune.getName(), '辛巳');

      // 流年
      expect(fortune.getSixtyCycleYear().getSixtyCycle().getName(), '己巳');
    });

    test('test14 - 大运/小运测试', () {
      // 童限
      ChildLimit childLimit = ChildLimit.fromSolarTime(SolarTime.fromYmdHms(1992, 2, 2, 12, 0, 0), Gender.MAN);
      // 八字
      expect(childLimit.getEightChar().toString(), '辛未 辛丑 戊申 戊午');
      // 童限年数
      expect(childLimit.getYearCount(), 9);
      // 童限月数
      expect(childLimit.getMonthCount(), 0);
      // 童限日数
      expect(childLimit.getDayCount(), 9);
      // 童限结束(即开始起运)的公历时刻
      expect(childLimit.getEndTime().toString(), '2001年2月11日 18:58:00');
      // 童限开始(即出生)的农历年干支
      expect(childLimit.getStartTime().getLunarHour().getLunarDay().month.year.getSixtyCycle().getName(), '辛未');
      // 童限结束(即开始起运)的农历年干支
      expect(childLimit.getEndTime().getLunarHour().getLunarDay().month.year.getSixtyCycle().getName(), '辛巳');

      // 第1轮大运
      DecadeFortune decadeFortune = childLimit.getStartDecadeFortune();
      // 开始年龄
      expect(decadeFortune.getStartAge(), 10);
      // 结束年龄
      expect(decadeFortune.getEndAge(), 19);
      // 开始年
      expect(decadeFortune.getStartSixtyCycleYear().getYear(), 2001);
      // 结束年
      expect(decadeFortune.getEndSixtyCycleYear().getYear(), 2010);
      // 干支
      expect(decadeFortune.getName(), '庚子');
      // 下一大运
      expect(decadeFortune.next(1).getName(), '己亥');

      // 小运
      Fortune fortune = childLimit.getStartFortune();
      // 年龄
      expect(fortune.getAge(), 10);
      // 农历年
      expect(fortune.getSixtyCycleYear().getYear(), 2001);
      // 干支
      expect(fortune.getName(), '戊申');
      // 小运推移
      expect(fortune.next(2).getName(), '丙午');
      expect(fortune.next(-2).getName(), '庚戌');

      // 流年
      expect(fortune.getSixtyCycleYear().getSixtyCycle().getName(), '辛巳');
    });

    test('test15 - 排盘示例', () {
      EightChar eightChar = EightChar.fromName('丙寅', '癸巳', '癸酉', '己未');
      SixtyCycle year = eightChar.getYear();
      SixtyCycle month = eightChar.getMonth();
      SixtyCycle day = eightChar.getDay();
      SixtyCycle hour = eightChar.getHour();

      HeavenStem me = day.getHeavenStem();

      // 验证主星
      expect(me.getTenStar(year.getHeavenStem())!.getName(), '正财');
      expect(me.getTenStar(month.getHeavenStem())!.getName(), '比肩');
      expect(me.getTenStar(hour.getHeavenStem())!.getName(), '七杀');

      // 验证八字
      expect(year.getName(), '丙寅');
      expect(month.getName(), '癸巳');
      expect(day.getName(), '癸酉');
      expect(hour.getName(), '己未');

      // 验证藏干（年柱）
      expect(year.getEarthBranch().getHideHeavenStemMain().getName(), '甲');
      expect(year.getEarthBranch().getHideHeavenStemMiddle()?.getName(), '丙');
      expect(year.getEarthBranch().getHideHeavenStemResidual()?.getName(), '戊');

      // 验证副星（年柱藏干十神）
      expect(me.getTenStar(year.getEarthBranch().getHideHeavenStemMain())!.getName(), '伤官');
      expect(me.getTenStar(year.getEarthBranch().getHideHeavenStemMiddle()!)!.getName(), '正财');
      expect(me.getTenStar(year.getEarthBranch().getHideHeavenStemResidual()!)!.getName(), '正官');

      // 验证五行
      expect(year.getHeavenStem().getElement().getName(), '火');
      expect(year.getEarthBranch().getElement().getName(), '木');

      // 验证纳音
      expect(year.getSound().getName(), '炉中火');
      expect(month.getSound().getName(), '长流水');
      expect(day.getSound().getName(), '剑锋金');
      expect(hour.getSound().getName(), '天上火');

      // 验证星运（地势）
      expect(me.getTerrain(year.getEarthBranch()).getName(), '沐浴');
      expect(me.getTerrain(month.getEarthBranch()).getName(), '胎');
      expect(me.getTerrain(day.getEarthBranch()).getName(), '病');
      expect(me.getTerrain(hour.getEarthBranch()).getName(), '墓');

      // 验证自坐（排盘输出验证，不做断言）
      // 丙寅自坐: 长生, 癸巳自坐: 胎, 癸酉自坐: 病, 己未自坐: 冠带

      // 验证空亡
      expect(year.getExtraEarthBranches().length, 2);
      expect(month.getExtraEarthBranches().length, 2);
      expect(day.getExtraEarthBranches().length, 2);
      expect(hour.getExtraEarthBranches().length, 2);

      // 验证胎元/胎息/命宫/身宫
      expect(eightChar.getFetalOrigin().getName(), '甲申');
      expect(eightChar.getFetalOrigin().getSound().getName(), '泉中水');
      expect(eightChar.getFetalBreath().getName(), '戊辰');
      expect(eightChar.getFetalBreath().getSound().getName(), '大林木');
      expect(eightChar.getOwnSign().getName(), '癸巳');
      expect(eightChar.getOwnSign().getSound().getName(), '长流水');
      expect(eightChar.getBodySign().getName(), '辛丑');
      expect(eightChar.getBodySign().getSound().getName(), '壁上土');
    });

    test('test16 - 童限测试', () {
      // 童限
      ChildLimit childLimit = ChildLimit.fromSolarTime(SolarTime.fromYmdHms(1990, 3, 15, 10, 30, 0), Gender.MAN);
      // 八字
      expect(childLimit.getEightChar().toString(), '庚午 己卯 己卯 己巳');
      // 童限年数
      expect(childLimit.getYearCount(), 6);
      // 童限月数
      expect(childLimit.getMonthCount(), 11);
      // 童限日数
      expect(childLimit.getDayCount(), 23);
      // 童限结束(即开始起运)的公历时刻
      expect(childLimit.getEndTime().toString(), '1997年3月11日 00:22:00');

      // 小运
      Fortune fortune = childLimit.getStartFortune();
      // 年龄
      expect(fortune.getAge(), 8);
    });

    test('test17 - 命宫测试', () {
      expect(EightChar.fromName('己丑', '戊辰', '戊辰', '甲子').getOwnSign().getName(), '丁丑');
    });

    test('test18 - 命宫测试', () {
      expect(EightChar.fromName('戊戌', '庚申', '丁亥', '丙午').getOwnSign().getName(), '乙卯');
    });

    test('test20 - 八字和命宫身宫测试', () {
      EightChar eightChar = ChildLimit.fromSolarTime(SolarTime.fromYmdHms(2024, 1, 29, 9, 33, 0), Gender.MAN).getEightChar();
      expect(eightChar.toString(), '癸卯 乙丑 壬辰 乙巳');
      expect(eightChar.getOwnSign().getName(), '癸亥');
      expect(eightChar.getBodySign().getName(), '己未');
    });

    test('test22 - 身宫测试', () {
      expect(ChildLimit.fromSolarTime(SolarTime.fromYmdHms(1990, 1, 27, 0, 0, 0), Gender.MAN).getEightChar().getBodySign().getName(), '丙寅');
    });

    test('test23 - 命宫测试', () {
      expect(ChildLimit.fromSolarTime(SolarTime.fromYmdHms(2019, 3, 7, 8, 0, 0), Gender.MAN).getEightChar().getOwnSign().getName(), '甲戌');
    });

    test('test24 - 命宫测试', () {
      expect(ChildLimit.fromSolarTime(SolarTime.fromYmdHms(2019, 3, 27, 2, 0, 0), Gender.MAN).getEightChar().getOwnSign().getName(), '丁丑');
    });

    test('test25 - 命宫测试', () {
      expect(LunarHour.fromYmdHms(1994, 5, 20, 18, 0, 0).getEightChar().getOwnSign().getName(), '丙寅');
    });

    test('test26 - 八字全面测试', () {
      EightChar eightChar = SolarTime.fromYmdHms(1986, 5, 29, 13, 37, 0).getLunarHour().getEightChar();
      expect(eightChar.toString(), '丙寅 癸巳 癸酉 己未');
      expect(eightChar.getOwnSign().getName(), '癸巳');
      expect(eightChar.getBodySign().getName(), '辛丑');
      expect(eightChar.getFetalOrigin().getName(), '甲申');
      expect(eightChar.getFetalBreath().getName(), '戊辰');
    });

    test('test27 - 八字全面测试', () {
      EightChar eightChar = SolarTime.fromYmdHms(1994, 12, 6, 2, 0, 0).getLunarHour().getEightChar();
      expect(eightChar.toString(), '甲戌 乙亥 丙寅 己丑');
      expect(eightChar.getOwnSign().getName(), '己巳');
      expect(eightChar.getBodySign().getName(), '丁丑');
      expect(eightChar.getFetalOrigin().getName(), '丙寅');
      expect(eightChar.getFetalBreath().getName(), '辛亥');
    });

    test('test28 - 命宫测试', () {
      expect(EightChar.fromName('辛亥', '丁酉', '丙午', '癸巳').getOwnSign().getName(), '辛卯');
    });

    test('test29 - 命宫身宫测试', () {
      EightChar eightChar = EightChar.fromName('丙寅', '庚寅', '辛卯', '壬辰');
      expect(eightChar.getOwnSign().getName(), '己亥');
      expect(eightChar.getBodySign().getName(), '乙未');
    });

    test('test30 - 身宫测试', () {
      expect(EightChar.fromName('壬子', '辛亥', '壬戌', '乙巳').getBodySign().getName(), '乙巳');
    });

    test('test31 - 八字反推公历时刻', () {
      List<SolarTime> solarTimes = EightChar.fromName('丙辰', '丁酉', '丙子', '甲午').getSolarTimes(1900, 2024);
      List<String> actual = solarTimes.map((e) => e.toString()).toList();

      List<String> expected = [
        '1916年10月6日 12:00:00',
        '1976年9月21日 12:00:00',
      ];
      expect(actual, expected);
    });

    test('test32 - 八字反推公历时刻', () {
      List<SolarTime> solarTimes = EightChar.fromName('壬寅', '庚戌', '己未', '乙亥').getSolarTimes(1900, 2024);
      List<String> actual = solarTimes.map((e) => e.toString()).toList();

      List<String> expected = [
        '2022年11月2日 22:00:00',
      ];
      expect(actual, expected);
    });

    test('test33 - 八字反推公历时刻', () {
      List<SolarTime> solarTimes = EightChar.fromName('己卯', '辛未', '甲戌', '壬申').getSolarTimes(1900, 2024);
      List<String> actual = solarTimes.map((e) => e.toString()).toList();

      List<String> expected = [
        '1939年8月5日 16:00:00',
        '1999年7月21日 16:00:00',
      ];
      expect(actual, expected);
    });

    test('test34 - 八字反推公历时刻', () {
      List<SolarTime> solarTimes = EightChar.fromName('庚子', '戊子', '己卯', '庚午').getSolarTimes(1900, 2024);
      List<String> actual = solarTimes.map((e) => e.toString()).toList();

      List<String> expected = [
        '1901年1月1日 12:00:00',
        '1960年12月17日 12:00:00',
      ];
      expect(actual, expected);
    });

    test('test35 - 八字反推公历时刻', () {
      List<SolarTime> solarTimes = EightChar.fromName('庚子', '癸未', '乙丑', '丁亥').getSolarTimes(1900, 2024);
      List<String> actual = solarTimes.map((e) => e.toString()).toList();

      List<String> expected = [
        '1960年8月5日 22:00:00',
        '2020年7月21日 22:00:00',
      ];
      expect(actual, expected);
    });

    test('test36 - 八字反推公历时刻', () {
      List<SolarTime> solarTimes = EightChar.fromName('癸卯', '甲寅', '甲寅', '甲子').getSolarTimes(1800, 2024);
      List<String> actual = solarTimes.map((e) => e.toString()).toList();

      List<String> expected = [
        '1843年2月9日 00:00:00',
        '2023年2月25日 00:00:00',
      ];
      expect(actual, expected);
    });

    test('test37 - 八字反推公历时刻', () {
      List<SolarTime> solarTimes = EightChar.fromName('甲辰', '丙寅', '己亥', '戊辰').getSolarTimes(1800, 2024);
      List<String> actual = solarTimes.map((e) => e.toString()).toList();

      List<String> expected = [
        '1904年3月6日 07:00:00',
        '1964年2月20日 08:00:00',
        '2024年2月5日 08:00:00',
      ];
      expect(actual, expected);
    });

    test('test38 - 八字反推公历时刻', () {
      List<SolarTime> solarTimes = EightChar.fromName('己亥', '丁丑', '壬寅', '戊申').getSolarTimes(1900, 2024);
      List<String> actual = solarTimes.map((e) => e.toString()).toList();

      List<String> expected = [
        '1900年1月29日 16:00:00',
        '1960年1月15日 16:00:00',
      ];
      expect(actual, expected);
    });

    test('test39 - 八字反推公历时刻', () {
      List<SolarTime> solarTimes = EightChar.fromName('己亥', '丙子', '癸酉', '庚申').getSolarTimes(1900, 2024);
      List<String> actual = solarTimes.map((e) => e.toString()).toList();

      List<String> expected = [
        '1959年12月17日 16:00:00',
      ];
      expect(actual, expected);
    });

    test('test40 - 八字反推公历时刻', () {
      List<SolarTime> solarTimes = EightChar.fromName('丁丑', '癸卯', '癸丑', '辛酉').getSolarTimes(1900, 2024);
      List<String> actual = solarTimes.map((e) => e.toString()).toList();

      List<String> expected = [
        '1937年3月27日 18:00:00',
        '1997年3月12日 18:00:00',
      ];
      expect(actual, expected);
    });

    test('test41 - 八字反推公历时刻', () {
      List<SolarTime> solarTimes = EightChar.fromName('乙未', '己卯', '丁丑', '甲辰').getSolarTimes(1900, 2024);
      List<String> actual = solarTimes.map((e) => e.toString()).toList();

      List<String> expected = [
        '1955年3月17日 08:00:00',
      ];
      expect(actual, expected);
    });

    test('test42 - 命宫测试', () {
      expect(EightChar.fromName('甲辰', '丙寅', '己亥', '辛未').getOwnSign().getName(), '壬申');
    });

    test('test43 - China95ChildLimitProvider 测试', () {
      // 采用元亨利贞的起运算法
      ChildLimit.provider = China95ChildLimitProvider();
      // 童限
      ChildLimit childLimit = ChildLimit.fromSolarTime(SolarTime.fromYmdHms(1986, 5, 29, 13, 37, 0), Gender.MAN);
      // 童限年数
      expect(childLimit.getYearCount(), 2);
      // 童限月数
      expect(childLimit.getMonthCount(), 7);
      // 童限日数
      expect(childLimit.getDayCount(), 0);
      // 童限时数
      expect(childLimit.getHourCount(), 0);
      // 童限分数
      expect(childLimit.getMinuteCount(), 0);
      // 童限结束(即开始起运)的公历时刻
      expect(childLimit.getEndTime().toString(), '1988年12月29日 13:37:00');

      // 为了不影响其他测试用例，恢复默认起运算法
      ChildLimit.provider = DefaultChildLimitProvider();
    });

    test('test44 - 童限测试', () {
      // 童限
      ChildLimit childLimit = ChildLimit.fromSolarTime(SolarTime.fromYmdHms(1989, 12, 31, 23, 7, 17), Gender.MAN);
      // 童限结束(即开始起运)的公历时刻
      expect(childLimit.getEndTime().toString(), '1998年3月1日 19:47:17');
    });

    test('test45 - LunarSect1ChildLimitProvider 测试', () {
      // 童限
      ChildLimit.provider = LunarSect1ChildLimitProvider();

      ChildLimit childLimit = ChildLimit.fromSolarTime(SolarTime.fromYmdHms(1994, 10, 17, 1, 0, 0), Gender.MAN);
      expect(childLimit.getEndTime().toString(), '2002年1月27日 01:00:00');
      expect(childLimit.getStartDecadeFortune().getStartSixtyCycleYear().getSixtyCycle().getName(), '壬午');

      // 为了不影响其他测试用例，恢复默认起运算法
      ChildLimit.provider = DefaultChildLimitProvider();
    });

    test('test46 - LunarSect2EightCharProvider 测试', () {
      LunarHour.provider = LunarSect2EightCharProvider();
      List<SolarTime> solarTimes = EightChar.fromName('壬寅', '丙午', '己亥', '丙子').getSolarTimes(1900, 2024);
      List<String> actual = solarTimes.map((e) => e.toString()).toList();

      List<String> expected = [
        '1962年6月30日 23:00:00',
        '2022年6月15日 23:00:00',
      ];
      expect(actual, expected);
      LunarHour.provider = DefaultEightCharProvider();
    });

    test('test47 - 地势(长生十二神)', () {
      // 日元(日主、日干)
      HeavenStem me = HeavenStem.fromName('丙');
      // 地势
      expect(me.getTerrain(EarthBranch.fromName('寅')).getName(), '长生');
    });

    test('test48 - LunarSect1ChildLimitProvider 另一个测试', () {
      // 童限
      ChildLimit.provider = LunarSect1ChildLimitProvider();

      ChildLimit childLimit = ChildLimit.fromSolarTime(SolarTime.fromYmdHms(2025, 2, 18, 16, 0, 0), Gender.MAN);
      expect(childLimit.getStartFortune().getSixtyCycle().getName(), '甲寅');
      expect(childLimit.getEndTime().toString(), '2030年1月18日 16:00:00');
      expect(childLimit.getEndSixtyCycleYear().getSixtyCycle().getName(), '庚戌');
      expect(childLimit.getStartFortune().getSixtyCycleYear().getSixtyCycle().getName(), '庚戌');

      // 为了不影响其他测试用例，恢复默认起运算法
      ChildLimit.provider = DefaultChildLimitProvider();
    });

    test('test49 - 八字全面测试', () {
      EightChar eightChar = SolarTime.fromYmdHms(1980, 6, 15, 12, 30, 30).getLunarHour().getEightChar();
      expect(eightChar.getOwnSign().getName(), '辛巳');
      expect(eightChar.getBodySign().getName(), '己丑');
      expect(eightChar.getFetalOrigin().getName(), '癸酉');
      expect(eightChar.getFetalBreath().getName(), '甲午');
    });

    test('test50 - 八字反推公历时刻', () {
      List<SolarTime> solarTimes = EightChar.fromName('壬申', '壬寅', '庚辰', '甲申').getSolarTimes(1801, 2099);
      List<String> actual = solarTimes.map((e) => e.toString()).toList();

      List<String> expected = [
        '1812年2月18日 16:00:00',
        '1992年3月5日 15:00:00',
        '2052年2月19日 16:00:00',
      ];
      expect(actual, expected);
    });

    test('test51 - 八字测试', () {
      expect(SolarTime.fromYmdHms(1034, 10, 2, 20, 0, 0).getLunarHour().getEightChar().toString(), '甲戌 癸酉 甲戌 甲戌');
    });
  });
}
