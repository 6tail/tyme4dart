import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 儒略日测试
///
/// Author: 6tail
void main() {
  group('JulianDay Tests', () {
    test('test0', () {
      expect(SolarDay.fromYmd(2023, 1, 1).getJulianDay().getSolarDay().toString(), '2023年1月1日');
    });
  });
}
