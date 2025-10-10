import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 星座测试
///
/// Author: 6tail
void main() {
  group('Constellation Tests', () {
    test('test0 - 白羊座', () {
      expect(SolarDay.fromYmd(2020, 3, 21).getConstellation().getName(), '白羊');
      expect(SolarDay.fromYmd(2020, 4, 19).getConstellation().getName(), '白羊');
    });

    test('test1 - 金牛座', () {
      expect(SolarDay.fromYmd(2020, 4, 20).getConstellation().getName(), '金牛');
      expect(SolarDay.fromYmd(2020, 5, 20).getConstellation().getName(), '金牛');
    });

    test('test2 - 双子座', () {
      expect(SolarDay.fromYmd(2020, 5, 21).getConstellation().getName(), '双子');
      expect(SolarDay.fromYmd(2020, 6, 21).getConstellation().getName(), '双子');
    });

    test('test3 - 巨蟹座', () {
      expect(SolarDay.fromYmd(2020, 6, 22).getConstellation().getName(), '巨蟹');
      expect(SolarDay.fromYmd(2020, 7, 22).getConstellation().getName(), '巨蟹');
    });

    test('test4 - 狮子座', () {
      var solar = SolarDay.fromYmd(2020, 7, 23);
      expect(solar.getConstellation().getName(), '狮子');
      solar = SolarDay.fromYmd(2020, 8, 22);
      expect(solar.getConstellation().getName(), '狮子');
    });

    test('test5 - 处女座', () {
      var solar = SolarDay.fromYmd(2020, 8, 23);
      expect(solar.getConstellation().getName(), '处女');
      solar = SolarDay.fromYmd(2020, 9, 22);
      expect(solar.getConstellation().getName(), '处女');
    });

    test('test6 - 天秤座', () {
      var solar = SolarDay.fromYmd(2020, 9, 23);
      expect(solar.getConstellation().getName(), '天秤');
      solar = SolarDay.fromYmd(2020, 10, 23);
      expect(solar.getConstellation().getName(), '天秤');
    });

    test('test7 - 天蝎座', () {
      var solar = SolarDay.fromYmd(2020, 10, 24);
      expect(solar.getConstellation().getName(), '天蝎');
      solar = SolarDay.fromYmd(2020, 11, 22);
      expect(solar.getConstellation().getName(), '天蝎');
    });

    test('test8 - 射手座', () {
      var solar = SolarDay.fromYmd(2020, 11, 23);
      expect(solar.getConstellation().getName(), '射手');
      solar = SolarDay.fromYmd(2020, 12, 21);
      expect(solar.getConstellation().getName(), '射手');
    });

    test('test9 - 摩羯座', () {
      var solar = SolarDay.fromYmd(2020, 12, 22);
      expect(solar.getConstellation().getName(), '摩羯');
      solar = SolarDay.fromYmd(2021, 1, 19);
      expect(solar.getConstellation().getName(), '摩羯');
    });

    test('test10 - 水瓶座', () {
      var solar = SolarDay.fromYmd(2021, 1, 20);
      expect(solar.getConstellation().getName(), '水瓶');
      solar = SolarDay.fromYmd(2021, 2, 18);
      expect(solar.getConstellation().getName(), '水瓶');
    });

    test('test11 - 双鱼座', () {
      var solar = SolarDay.fromYmd(2021, 2, 19);
      expect(solar.getConstellation().getName(), '双鱼');
      solar = SolarDay.fromYmd(2021, 3, 20);
      expect(solar.getConstellation().getName(), '双鱼');
    });
  });
}
