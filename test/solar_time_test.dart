import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 公历时刻测试
///
/// Author: 6tail
void main() {
  group('SolarTime Tests', () {
    test('test0 - 时刻推移', () {
      var time = SolarTime.fromYmdHms(2023, 1, 1, 13, 5, 20);
      expect(time.getName(), '13:05:20');
      expect(time.next(-21).getName(), '13:04:59');
    });

    test('test1 - 大跨度推移', () {
      var time = SolarTime.fromYmdHms(2023, 1, 1, 13, 5, 20);
      expect(time.getName(), '13:05:20');
      expect(time.next(3641).getName(), '14:06:01');
    });
  });
}
