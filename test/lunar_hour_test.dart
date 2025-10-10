import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 农历时辰测试
///
/// Author: 6tail
void main() {
  group('LunarHour Tests', () {
    test('test1 - 23点时辰（换日）', () {
      var h = LunarHour.fromYmdHms(2020, -4, 5, 23, 0, 0);
      expect(h.getName(), '子时');
      expect(h.toString(), '农历庚子年闰四月初五戊子时');
    });

    test('test2 - 0点59分时辰', () {
      var h = LunarHour.fromYmdHms(2020, -4, 5, 0, 59, 0);
      expect(h.getName(), '子时');
      expect(h.toString(), '农历庚子年闰四月初五丙子时');
    });

    test('test3 - 1点时辰', () {
      var h = LunarHour.fromYmdHms(2020, -4, 5, 1, 0, 0);
      expect(h.getName(), '丑时');
      expect(h.toString(), '农历庚子年闰四月初五丁丑时');
    });

    test('test4 - 21点30分时辰', () {
      var h = LunarHour.fromYmdHms(2020, -4, 5, 21, 30, 0);
      expect(h.getName(), '亥时');
      expect(h.toString(), '农历庚子年闰四月初五丁亥时');
    });

    test('test5 - 初二23点30分', () {
      var h = LunarHour.fromYmdHms(2020, -4, 2, 23, 30, 0);
      expect(h.getName(), '子时');
      expect(h.toString(), '农历庚子年闰四月初二壬子时');
    });

    test('test6 - 四月廿八23点30分', () {
      var h = LunarHour.fromYmdHms(2020, 4, 28, 23, 30, 0);
      expect(h.getName(), '子时');
      expect(h.toString(), '农历庚子年四月廿八甲子时');
    });

    test('test7 - 四月廿九0点', () {
      var h = LunarHour.fromYmdHms(2020, 4, 29, 0, 0, 0);
      expect(h.getName(), '子时');
      expect(h.toString(), '农历庚子年四月廿九甲子时');
    });

    test('test8 - 时辰干支（23点换日）', () {
      var h = LunarHour.fromYmdHms(2023, 11, 14, 23, 0, 0);
      var sixtyCycleHour = h.getSixtyCycleHour();

      // 时辰干支
      expect(h.getSixtyCycle().getName(), '甲子');

      // 日干支（23点算第二天）
      expect(sixtyCycleHour.getDay().getName(), '己未');
      expect(h.day.getSixtyCycle().getName(), '戊午');
      expect(h.day.toString(), '农历癸卯年十一月十四');

      // 月干支
      expect(sixtyCycleHour.getMonth().getName(), '甲子');
      expect(h.day.month.toString(), '农历癸卯年十一月');
      expect(h.day.month.getSixtyCycle().getName(), '甲子');

      // 年干支
      expect(sixtyCycleHour.getYear().getName(), '癸卯');
      expect(h.day.month.year.toString(), '农历癸卯年');
      expect(h.day.month.year.getSixtyCycle().getName(), '癸卯');
    });

    test('test9 - 时辰干支（6点不换日）', () {
      var h = LunarHour.fromYmdHms(2023, 11, 14, 6, 0, 0);
      var sixtyCycleHour = h.getSixtyCycleHour();

      // 时辰干支
      expect(h.getSixtyCycle().getName(), '乙卯');

      // 日干支（6点不换日）
      expect(sixtyCycleHour.getDay().getName(), '戊午');
      expect(h.day.getSixtyCycle().getName(), '戊午');
      expect(h.day.toString(), '农历癸卯年十一月十四');

      // 月干支
      expect(sixtyCycleHour.getMonth().getName(), '甲子');
      expect(h.day.month.toString(), '农历癸卯年十一月');
      expect(h.day.month.getSixtyCycle().getName(), '甲子');

      // 年干支
      expect(sixtyCycleHour.getYear().getName(), '癸卯');
      expect(h.day.month.year.toString(), '农历癸卯年');
      expect(h.day.month.year.getSixtyCycle().getName(), '癸卯');
    });

    test('test28 - 小人遁', () {
      var h = LunarHour.fromYmdHms(2024, 9, 7, 10, 0, 0);
      expect(h.getMinorRen().getName(), '留连');
    });
  });
}
