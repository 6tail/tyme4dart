import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 九星测试
///
/// Author: 6tail
void main() {
  group('NineStar Tests', () {
    test('test0 - 1985年九星', () {
      var nineStar = LunarYear.fromYear(1985).getNineStar();
      expect(nineStar.getName(), '六');
      expect(nineStar.toString(), '六白金');
    });

    test('test1 - 2022年九星', () {
      var nineStar = LunarYear.fromYear(2022).getNineStar();
      expect(nineStar.toString(), '五黄土');
      expect(nineStar.getDipper().toString(), '玉衡');
    });

    test('test2 - 2033年九星', () {
      var nineStar = LunarYear.fromYear(2033).getNineStar();
      expect(nineStar.toString(), '三碧木');
      expect(nineStar.getDipper().toString(), '天玑');
    });

    test('test3 - 1985年2月九星', () {
      var nineStar = LunarMonth.fromYm(1985, 2).getNineStar();
      expect(nineStar.toString(), '四绿木');
      expect(nineStar.getDipper().toString(), '天权');
    });

    test('test4 - 1985年2月九星（重复测试）', () {
      var nineStar = LunarMonth.fromYm(1985, 2).getNineStar();
      expect(nineStar.toString(), '四绿木');
      expect(nineStar.getDipper().toString(), '天权');
    });

    test('test5 - 2022年1月九星', () {
      var nineStar = LunarMonth.fromYm(2022, 1).getNineStar();
      expect(nineStar.toString(), '二黑土');
      expect(nineStar.getDipper().toString(), '天璇');
    });

    test('test6 - 2033年1月九星', () {
      var nineStar = LunarMonth.fromYm(2033, 1).getNineStar();
      expect(nineStar.toString(), '五黄土');
      expect(nineStar.getDipper().toString(), '玉衡');
    });

    test('test7 - 1985年2月19日九星', () {
      var nineStar = SolarDay.fromYmd(1985, 2, 19).getLunarDay().getNineStar();
      expect(nineStar.toString(), '五黄土');
      expect(nineStar.getDipper().toString(), '玉衡');
    });

    test('test8 - 2022年1月1日九星', () {
      var nineStar = LunarDay.fromYmd(2022, 1, 1).getNineStar();
      expect(nineStar.toString(), '四绿木');
      expect(nineStar.getDipper().toString(), '天权');
    });

    test('test9 - 2033年1月1日九星', () {
      var nineStar = LunarDay.fromYmd(2033, 1, 1).getNineStar();
      expect(nineStar.toString(), '一白水');
      expect(nineStar.getDipper().toString(), '天枢');
    });

    test('test10 - 2033年1月1日12时九星', () {
      var nineStar = LunarHour.fromYmdHms(2033, 1, 1, 12, 0, 0).getNineStar();
      expect(nineStar.toString(), '七赤金');
      expect(nineStar.getDipper().toString(), '摇光');
    });

    test('test11 - 2011年5月3日23时九星', () {
      var nineStar = LunarHour.fromYmdHms(2011, 5, 3, 23, 0, 0).getNineStar();
      expect(nineStar.toString(), '七赤金');
      expect(nineStar.getDipper().toString(), '摇光');
    });

    test('test12 - 2024年11月和12月九星', () {
      var m = LunarMonth.fromYm(2024, 11);
      expect(m.getNineStar().toString(), '四绿木');
      m = LunarMonth.fromYm(2024, 12);
      expect(m.getNineStar().toString(), '三碧木');
    });
  });
}
