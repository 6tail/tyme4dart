import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 月相测试
///
/// Author: 6tail
void main() {
  group('Phase Tests', () {
    test('test0 - 下弦月（按名称）', () {
      var phase = Phase.fromName(2025, 7, '下弦月');
      expect(phase.getSolarTime().toString(), '2025年9月14日 18:32:57');
    });

    test('test1 - 下弦月（按索引）', () {
      var phase = Phase.fromIndex(2025, 7, 6);
      expect(phase.getSolarTime().toString(), '2025年9月14日 18:32:57');
    });

    test('test2 - 新月', () {
      var phase = Phase.fromIndex(2025, 7, 8);
      expect(phase.getSolarTime().toString(), '2025年9月22日 03:54:07');
    });

    test('test3 - 从公历日获取月相', () {
      var phase = SolarDay.fromYmd(2025, 9, 21).getPhase();
      expect(phase.toString(), '残月');
    });

    test('test4 - 从农历日获取月相', () {
      var phase = LunarDay.fromYmd(2025, 7, 30).getPhase();
      expect(phase.toString(), '残月');
    });

    test('test5 - 从时刻获取月相（蛾眉月）', () {
      var phase = SolarTime.fromYmdHms(2025, 9, 22, 4, 0, 0).getPhase();
      expect(phase.toString(), '蛾眉月');
    });

    test('test6 - 从时刻获取月相（残月）', () {
      var phase = SolarTime.fromYmdHms(2025, 9, 22, 3, 0, 0).getPhase();
      expect(phase.toString(), '残月');
    });

    test('test7 - 月相日（新月第1天）', () {
      var d = SolarDay.fromYmd(2023, 9, 15).getPhaseDay();
      expect(d.toString(), '新月第1天');
    });

    test('test8 - 月相日（蛾眉月第2天）', () {
      var d = SolarDay.fromYmd(2023, 9, 17).getPhaseDay();
      expect(d.toString(), '蛾眉月第2天');
    });

    test('test9 - 精确时刻（新月）', () {
      var phase = SolarTime.fromYmdHms(2025, 9, 22, 3, 54, 7).getPhase();
      expect(phase.toString(), '新月');
    });

    test('test10 - 精确时刻（残月）', () {
      var phase = SolarTime.fromYmdHms(2025, 9, 22, 3, 54, 6).getPhase();
      expect(phase.toString(), '残月');
    });

    test('test11 - 精确时刻（蛾眉月）', () {
      var phase = SolarTime.fromYmdHms(2025, 9, 22, 3, 54, 8).getPhase();
      expect(phase.toString(), '蛾眉月');
    });

    test('test12 - 闰月月相', () {
      var phase = LunarDay.fromYmd(2025, -6, 20).getPhase();
      expect(phase.toString(), '亏凸月');
    });

    test('test13 - 公历日月相（亏凸月）', () {
      var phase = SolarDay.fromYmd(2025, 8, 13).getPhase();
      expect(phase.toString(), '亏凸月');
    });
  });
}
