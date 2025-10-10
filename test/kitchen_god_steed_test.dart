import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 灶马头测试
///
/// Author: 6tail
void main() {
  group('KitchenGodSteed Tests', () {
    test('test1 - 几龙治水', () {
      expect(KitchenGodSteed.fromLunarYear(2017).getDragon(), '二龙治水');
      expect(KitchenGodSteed.fromLunarYear(2018).getDragon(), '二龙治水');
      expect(KitchenGodSteed.fromLunarYear(2019).getDragon(), '八龙治水');
      expect(KitchenGodSteed.fromLunarYear(5).getDragon(), '三龙治水');
    });

    test('test2 - 几人分饼', () {
      expect(KitchenGodSteed.fromLunarYear(2017).getCake(), '二人分饼');
      expect(KitchenGodSteed.fromLunarYear(2018).getCake(), '八人分饼');
      expect(KitchenGodSteed.fromLunarYear(5).getCake(), '一人分饼');
    });

    test('test3 - 几牛耕田', () {
      expect(KitchenGodSteed.fromLunarYear(2021).getCattle(), '十一牛耕田');
    });

    test('test4 - 几日得金', () {
      expect(KitchenGodSteed.fromLunarYear(2018).getGold(), '三日得金');
    });
  });
}
