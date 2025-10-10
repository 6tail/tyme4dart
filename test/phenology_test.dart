import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 物候测试
///
/// Author: 6tail
void main() {
  group('Phenology Tests', () {
    test('test0 - 2020年4月23日物候', () {
      var solarDay = SolarDay.fromYmd(2020, 4, 23);
      // 七十二候
      var phenology = solarDay.getPhenologyDay();
      // 三候
      var threePhenology = phenology.getPhenology().getThreePhenology();
      expect(solarDay.getTerm().getName(), '谷雨');
      expect(threePhenology.getName(), '初候');
      expect(phenology.getName(), '萍始生');
      expect(phenology.getPhenology().getJulianDay().getSolarDay().toString(), '2020年4月19日');
      expect(phenology.getPhenology().getJulianDay().getSolarTime().toString(), '2020年4月19日 22:45:29');
      // 该候的第5天
      expect(phenology.getDayIndex(), 4);
    });

    test('test1 - 2021年12月26日物候', () {
      var solarDay = SolarDay.fromYmd(2021, 12, 26);
      // 七十二候
      var phenology = solarDay.getPhenologyDay();
      // 三候
      var threePhenology = phenology.getPhenology().getThreePhenology();
      expect(solarDay.getTerm().getName(), '冬至');
      expect(solarDay.getTerm().getJulianDay().getSolarDay().toString(), '2021年12月21日');
      expect(threePhenology.getName(), '二候');
      expect(phenology.getName(), '麋角解');
      expect(phenology.getPhenology().getJulianDay().getSolarDay().toString(), '2021年12月26日');
      expect(phenology.getPhenology().getJulianDay().getSolarTime().toString(), '2021年12月26日 21:48:55');
      // 该候的第1天
      expect(phenology.getDayIndex(), 0);
    });

    test('test2 - 按索引获取物候', () {
      var p = Phenology.fromIndex(2026, 1);
      var jd = p.getJulianDay();
      expect(p.getName(), '麋角解');
      expect(jd.getSolarDay().toString(), '2025年12月26日');
      expect(jd.getSolarTime().toString(), '2025年12月26日 20:49:56');
    });

    test('test3 - 从公历日获取物候', () {
      var p = SolarDay.fromYmd(2025, 12, 26).getPhenology();
      var jd = p.getJulianDay();
      expect(p.getName(), '麋角解');
      expect(jd.getSolarDay().toString(), '2025年12月26日');
      expect(jd.getSolarTime().toString(), '2025年12月26日 20:49:56');
    });

    test('test4 - 从时刻获取物候', () {
      expect(SolarTime.fromYmdHms(2025, 12, 26, 20, 49, 38).getPhenology().getName(), '蚯蚓结');
      expect(SolarTime.fromYmdHms(2025, 12, 26, 20, 49, 56).getPhenology().getName(), '麋角解');
    });
  });
}
