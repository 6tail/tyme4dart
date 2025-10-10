import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 五行测试
///
/// Author: 6tail
void main() {
  group('Element Tests', () {
    /// 金克木
    test('test0 - 金克木', () {
      expect(Element.fromName('金').getRestrain(), Element.fromName('木'));
    });

    /// 火生土
    test('test1 - 火生土', () {
      expect(Element.fromName('火').getReinforce(), Element.fromName('土'));
    });

    test('test2 - 天干五行', () {
      expect(HeavenStem.fromName('丙').getElement().getName(), '火');
    });

    test('test3 - 地支五行', () {
      // 地支寅的五行为木
      expect(EarthBranch.fromName('寅').getElement().getName(), '木');

      // 地支寅的五行(木)生火
      expect(EarthBranch.fromName('寅').getElement().getReinforce(), Element.fromName('火'));
    });

    /// 生我的：火生土
    test('test4 - 生我的：火生土', () {
      expect(Element.fromName('土').getReinforced(), Element.fromName('火'));
    });
  });
}
