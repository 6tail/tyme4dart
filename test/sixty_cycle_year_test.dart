import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 干支年测试
///
/// Author: 6tail
void main() {
  group('SixtyCycleYear Tests', () {
    test('test0 - 2023年为癸卯年', () {
      expect(SixtyCycleYear.fromYear(2023).getName(), equals('癸卯年'));
    });

    test('test1 - 2023年后5年为戊申年', () {
      expect(SixtyCycleYear.fromYear(2023).next(5).getName(), equals('戊申年'));
    });

    test('test2 - 2023年前5年为戊戌年', () {
      expect(SixtyCycleYear.fromYear(2023).next(-5).getName(), equals('戊戌年'));
    });

    test('test3 - 2020年的干支为庚子', () {
      expect(SixtyCycleYear.fromYear(2020).getSixtyCycle().getName(), equals('庚子'));
    });

    test('test4 - 1986年的生肖为虎', () {
      expect(SixtyCycleYear.fromYear(1986).getSixtyCycle().getEarthBranch().getZodiac().getName(), equals('虎'));
    });

    test('test5 - 2025年前5年为庚子年', () {
      expect(SixtyCycleYear.fromYear(2025).next(-5).getName(), equals('庚子年'));
    });

    test('test7 - 2023年的干支和生肖', () {
      final y = SixtyCycleYear.fromYear(2023);
      expect(y.getSixtyCycle().getName(), equals('癸卯'));
      expect(y.getSixtyCycle().getEarthBranch().getZodiac().getName(), equals('兔'));
    });

    test('test8 - 1864年为上元', () {
      expect(SixtyCycleYear.fromYear(1864).getTwenty().getSixty().getName(), equals('上元'));
    });

    test('test9 - 1923年为上元', () {
      expect(SixtyCycleYear.fromYear(1923).getTwenty().getSixty().getName(), equals('上元'));
    });

    test('test10 - 1924年为中元', () {
      expect(SixtyCycleYear.fromYear(1924).getTwenty().getSixty().getName(), equals('中元'));
    });

    test('test11 - 1983年为中元', () {
      expect(SixtyCycleYear.fromYear(1983).getTwenty().getSixty().getName(), equals('中元'));
    });

    test('test12 - 1984年为下元', () {
      expect(SixtyCycleYear.fromYear(1984).getTwenty().getSixty().getName(), equals('下元'));
    });

    test('test13 - 2043年为下元', () {
      expect(SixtyCycleYear.fromYear(2043).getTwenty().getSixty().getName(), equals('下元'));
    });

    test('test14 - 1864年为一运', () {
      expect(SixtyCycleYear.fromYear(1864).getTwenty().getName(), equals('一运'));
    });

    test('test15 - 1883年为一运', () {
      expect(SixtyCycleYear.fromYear(1883).getTwenty().getName(), equals('一运'));
    });

    test('test16 - 1884年为二运', () {
      expect(SixtyCycleYear.fromYear(1884).getTwenty().getName(), equals('二运'));
    });

    test('test17 - 1903年为二运', () {
      expect(SixtyCycleYear.fromYear(1903).getTwenty().getName(), equals('二运'));
    });

    test('test18 - 1904年为三运', () {
      expect(SixtyCycleYear.fromYear(1904).getTwenty().getName(), equals('三运'));
    });

    test('test19 - 1923年为三运', () {
      expect(SixtyCycleYear.fromYear(1923).getTwenty().getName(), equals('三运'));
    });

    test('test20 - 2004年为八运', () {
      expect(SixtyCycleYear.fromYear(2004).getTwenty().getName(), equals('八运'));
    });

    test('test21 - 公元1年为六运中元', () {
      final year = SixtyCycleYear.fromYear(1);
      expect(year.getTwenty().getName(), equals('六运'));
      expect(year.getTwenty().getSixty().getName(), equals('中元'));
    });

    test('test22 - 公元1863年为九运下元', () {
      final year = SixtyCycleYear.fromYear(1863);
      expect(year.getTwenty().getName(), equals('九运'));
      expect(year.getTwenty().getSixty().getName(), equals('下元'));
    });

    test('test23 - 2025年的首月为戊寅月', () {
      expect(SixtyCycleYear.fromYear(2025).getFirstMonth().getName(), equals('戊寅月'));
    });
  });
}
