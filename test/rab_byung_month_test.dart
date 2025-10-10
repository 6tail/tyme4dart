import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 藏历月测试
///
/// Author: 6tail
void main() {
  group('RabByungMonth Tests', () {
    test('test0 - 1950年12月', () {
      expect(RabByungMonth.fromYm(1950, 12).toString(), '第十六饶迥铁虎年十二月');
    });
  });
}
