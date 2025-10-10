import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 宜忌测试
///
/// Author: 6tail
void main() {
  group('Taboo Tests', () {
    test('test0 - 2024-06-26 干支日宜', () {
      List<String> taboos = [];
      for (var t in SolarDay.fromYmd(2024, 6, 26).getSixtyCycleDay().getRecommends()) {
        taboos.add(t.getName());
      }
      expect(taboos, ['嫁娶', '祭祀', '理发', '作灶', '修饰垣墙', '平治道涂', '整手足甲', '沐浴', '冠笄']);
    });

    test('test1 - 2024-06-26 干支日忌', () {
      List<String> taboos = [];
      for (var t in SolarDay.fromYmd(2024, 6, 26).getSixtyCycleDay().getAvoids()) {
        taboos.add(t.getName());
      }
      expect(taboos, ['破土', '出行', '栽种']);
    });

    test('test2 - 2024-06-25 04:00 干支时宜', () {
      List<String> taboos = [];
      for (var t in SolarTime.fromYmdHms(2024, 6, 25, 4, 0, 0).getSixtyCycleHour().getRecommends()) {
        taboos.add(t.getName());
      }
      expect(taboos, isEmpty);
    });

    test('test3 - 2024-06-25 04:00 干支时忌', () {
      List<String> taboos = [];
      for (var t in SolarTime.fromYmdHms(2024, 6, 25, 4, 0, 0).getSixtyCycleHour().getAvoids()) {
        taboos.add(t.getName());
      }
      expect(taboos, ['诸事不宜']);
    });

    test('test4 - 2024-04-22 00:00 干支时宜', () {
      List<String> taboos = [];
      for (var t in SolarTime.fromYmdHms(2024, 4, 22, 0, 0, 0).getSixtyCycleHour().getRecommends()) {
        taboos.add(t.getName());
      }
      expect(taboos, ['嫁娶', '交易', '开市', '安床', '祭祀', '求财']);
    });

    test('test5 - 2024-04-22 00:00 干支时忌', () {
      List<String> taboos = [];
      for (var t in SolarTime.fromYmdHms(2024, 4, 22, 0, 0, 0).getSixtyCycleHour().getAvoids()) {
        taboos.add(t.getName());
      }
      expect(taboos, ['出行', '移徙', '赴任', '词讼', '祈福', '修造', '求嗣']);
    });

    test('test6 - 2021-03-07 干支日宜', () {
      List<String> taboos = [];
      for (var t in SolarDay.fromYmd(2021, 3, 7).getSixtyCycleDay().getRecommends()) {
        taboos.add(t.getName());
      }
      expect(taboos, ['裁衣', '经络', '伐木', '开柱眼', '拆卸', '修造', '动土', '上梁', '合脊', '合寿木', '入殓', '除服', '成服', '移柩', '破土', '安葬', '启钻', '修坟', '立碑']);
    });

    test('test7 - 2024-06-26 农历日宜', () {
      List<String> taboos = [];
      for (var t in SolarDay.fromYmd(2024, 6, 26).getLunarDay().getRecommends()) {
        taboos.add(t.getName());
      }
      expect(taboos, ['嫁娶', '祭祀', '理发', '作灶', '修饰垣墙', '平治道涂', '整手足甲', '沐浴', '冠笄']);
    });

    test('test8 - 2024-06-26 农历日忌', () {
      List<String> taboos = [];
      for (var t in SolarDay.fromYmd(2024, 6, 26).getLunarDay().getAvoids()) {
        taboos.add(t.getName());
      }
      expect(taboos, ['破土', '出行', '栽种']);
    });

    test('test9 - 2024-06-25 04:00 农历时宜', () {
      List<String> taboos = [];
      for (var t in SolarTime.fromYmdHms(2024, 6, 25, 4, 0, 0).getLunarHour().getRecommends()) {
        taboos.add(t.getName());
      }
      expect(taboos, isEmpty);
    });

    test('test10 - 2024-06-25 04:00 农历时忌', () {
      List<String> taboos = [];
      for (var t in SolarTime.fromYmdHms(2024, 6, 25, 4, 0, 0).getLunarHour().getAvoids()) {
        taboos.add(t.getName());
      }
      expect(taboos, ['诸事不宜']);
    });

    test('test11 - 2024-04-22 00:00 农历时宜', () {
      List<String> taboos = [];
      for (var t in SolarTime.fromYmdHms(2024, 4, 22, 0, 0, 0).getLunarHour().getRecommends()) {
        taboos.add(t.getName());
      }
      expect(taboos, ['嫁娶', '交易', '开市', '安床', '祭祀', '求财']);
    });

    test('test12 - 2024-04-22 00:00 农历时忌', () {
      List<String> taboos = [];
      for (var t in SolarTime.fromYmdHms(2024, 4, 22, 0, 0, 0).getLunarHour().getAvoids()) {
        taboos.add(t.getName());
      }
      expect(taboos, ['出行', '移徙', '赴任', '词讼', '祈福', '修造', '求嗣']);
    });

    test('test13 - 2021-03-07 农历日宜', () {
      List<String> taboos = [];
      for (var t in SolarDay.fromYmd(2021, 3, 7).getLunarDay().getRecommends()) {
        taboos.add(t.getName());
      }
      expect(taboos, ['裁衣', '经络', '伐木', '开柱眼', '拆卸', '修造', '动土', '上梁', '合脊', '合寿木', '入殓', '除服', '成服', '移柩', '破土', '安葬', '启钻', '修坟', '立碑']);
    });
  });
}
