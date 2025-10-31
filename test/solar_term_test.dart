import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 节气测试
///
/// Author: 6tail
void main() {
  group('SolarTerm Tests', () {
    test('test0 - 冬至节气及推移', () {
      // 冬至在去年，2022-12-22 05:48:11
      var dongZhi = SolarTerm.fromName(2023, '冬至');
      expect(dongZhi.getName(), '冬至');
      expect(dongZhi.getIndex(), 0);
      // 公历日
      expect(dongZhi.getJulianDay().getSolarDay().toString(), '2022年12月22日');
      expect(dongZhi.getSolarDay().toString(), '2022年12月22日');

      // 冬至顺推23次，就是大雪 2023-12-07 17:32:55
      var daXue = dongZhi.next(23);
      expect(daXue.getName(), '大雪');
      expect(daXue.getIndex(), 23);
      expect(daXue.getJulianDay().getSolarDay().toString(), '2023年12月7日');
      expect(daXue.getSolarDay().toString(), '2023年12月7日');

      // 冬至逆推2次，就是上一年的小雪 2022-11-22 16:20:28
      var xiaoXue = dongZhi.next(-2);
      expect(xiaoXue.getName(), '小雪');
      expect(xiaoXue.getIndex(), 22);
      expect(xiaoXue.getJulianDay().getSolarDay().toString(), '2022年11月22日');
      expect(xiaoXue.getSolarDay().toString(), '2022年11月22日');

      // 冬至顺推24次，就是下一个冬至 2023-12-22 11:27:20
      var dongZhi2 = dongZhi.next(24);
      expect(dongZhi2.getName(), '冬至');
      expect(dongZhi2.getIndex(), 0);
      expect(dongZhi2.getJulianDay().getSolarDay().toString(), '2023年12月22日');
      expect(dongZhi2.getSolarDay().toString(), '2023年12月22日');
    });

    test('test1 - 雨水节气', () {
      // 公历2023年的雨水，2023-02-19 06:34:16
      var jq = SolarTerm.fromName(2023, '雨水');
      expect(jq.getName(), '雨水');
      expect(jq.getIndex(), 4);
    });

    test('test2 - 大雪节气', () {
      // 公历2023年的大雪，2023-12-07 17:32:55
      var jq = SolarTerm.fromName(2023, '大雪');
      expect(jq.getName(), '大雪');
      // 索引
      expect(jq.getIndex(), 23);
      // 公历
      expect(jq.getJulianDay().getSolarDay().toString(), '2023年12月7日');
      expect(jq.getSolarDay().toString(), '2023年12月7日');
      // 农历
      expect(jq.getJulianDay().getSolarDay().getLunarDay().toString(), '农历癸卯年十月廿五');
      // 推移
      expect(jq.next(5).getName(), '雨水');
    });

    test('test3 - 从公历日获取节气', () {
      expect(SolarDay.fromYmd(2023, 10, 10).getTerm().getName(), '寒露');
    });

    test('test4 - 节气日', () {
      // 大雪当天
      expect(SolarDay.fromYmd(2023, 12, 7).getTermDay().toString(), '大雪第1天');
      // 天数索引
      expect(SolarDay.fromYmd(2023, 12, 7).getTermDay().getDayIndex(), 0);

      expect(SolarDay.fromYmd(2023, 12, 8).getTermDay().toString(), '大雪第2天');
      expect(SolarDay.fromYmd(2023, 12, 21).getTermDay().toString(), '大雪第15天');

      expect(SolarDay.fromYmd(2023, 12, 22).getTermDay().toString(), '冬至第1天');
    });

    test('test5 - 小寒', () {
      expect(SolarTerm.fromName(2024, '小寒').getJulianDay().getSolarTime().toString(), '2024年1月6日 04:49:22');
      expect(SolarTerm.fromName(2024, '小寒').getSolarDay().toString(), '2024年1月6日');
    });

    test('test6 - 寒露', () {
      expect(SolarTerm.fromName(1034, "寒露").getSolarDay().toString(), '1034年10月1日');
      expect(SolarTerm.fromName(1034, '寒露').getJulianDay().getSolarDay().toString(), '1034年10月3日');
      expect(SolarTerm.fromName(1034, '寒露').getJulianDay().getSolarTime().toString(), '1034年10月3日 06:02:28');
    });
  });
}
