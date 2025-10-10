import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 公历季度测试
///
/// Author: 6tail
void main() {
  group('SolarSeason Tests', () {
    test('test0 - 季度推移', () {
      var season = SolarSeason.fromIndex(2023, 0);
      expect(season.toString(), '2023年一季度');
      expect(season.next(-5).toString(), '2021年四季度');
    });
  });
}
