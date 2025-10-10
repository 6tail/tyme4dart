import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 干支月测试
///
/// Author: 6tail
void main() {
  group('SixtyCycleMonth Tests', () {
    test('test23 - 2025年寅月为乙巳年戊寅月', () {
      SixtyCycleMonth month = SixtyCycleMonth.fromIndex(2025, 0);
      expect(month.toString(), equals('乙巳年戊寅月'));
    });
  });
}
