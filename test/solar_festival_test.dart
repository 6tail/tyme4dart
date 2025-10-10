import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 公历现代节日测试
void main() {
  group('SolarFestival Tests', () {
    test('test0 - 遍历所有公历节日名称', () {
      for (int i = 0; i < SolarFestival.names.length; i++) {
        SolarFestival? f = SolarFestival.fromIndex(2023, i);
        expect(f, isNotNull);
        expect(f!.getName(), equals(SolarFestival.names[i]));
      }
    });

    test('test1 - 从第一个节日推移到所有节日', () {
      SolarFestival? f = SolarFestival.fromIndex(2023, 0);
      expect(f, isNotNull);
      for (int i = 0; i < SolarFestival.names.length; i++) {
        expect(f!.next(i).getName(), equals(SolarFestival.names[i]));
      }
    });

    test('test2 - 元旦推移测试', () {
      SolarFestival? f = SolarFestival.fromIndex(2023, 0);
      expect(f, isNotNull);
      expect(f!.next(13).toString(), equals('2024年5月1日 五一劳动节'));
      expect(f.next(-3).toString(), equals('2022年8月1日 八一建军节'));
    });

    test('test3 - 负向推移到三八妇女节', () {
      SolarFestival? f = SolarFestival.fromIndex(2023, 0);
      expect(f, isNotNull);
      expect(f!.next(-9).toString(), equals('2022年3月8日 三八妇女节'));
    });

    test('test4 - 从公历日获取元旦', () {
      SolarFestival? f = SolarDay.fromYmd(2010, 1, 1).getFestival();
      expect(f, isNotNull);
      expect(f.toString(), equals('2010年1月1日 元旦'));
    });

    test('test5 - 从公历日获取五四青年节', () {
      SolarFestival? f = SolarDay.fromYmd(2021, 5, 4).getFestival();
      expect(f, isNotNull);
      expect(f.toString(), equals('2021年5月4日 五四青年节'));
    });

    test('test6 - 1939年5月4日无节日', () {
      SolarFestival? f = SolarDay.fromYmd(1939, 5, 4).getFestival();
      expect(f, isNull);
    });
  });
}
