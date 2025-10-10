import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 公历半年测试
///
/// Author: 6tail
void main() {
  group('SolarHalfYear Tests', () {
    test('test0 - 上半年名称', () {
      expect(SolarHalfYear.fromIndex(2023, 0).getName(), '上半年');
      expect(SolarHalfYear.fromIndex(2023, 0).toString(), '2023年上半年');
    });

    test('test1 - 下半年名称', () {
      expect(SolarHalfYear.fromIndex(2023, 1).getName(), '下半年');
      expect(SolarHalfYear.fromIndex(2023, 1).toString(), '2023年下半年');
    });

    test('test2 - 推移1个半年', () {
      expect(SolarHalfYear.fromIndex(2023, 0).next(1).getName(), '下半年');
      expect(SolarHalfYear.fromIndex(2023, 0).next(1).toString(), '2023年下半年');
    });

    test('test3 - 推移2个半年（跨年）', () {
      expect(SolarHalfYear.fromIndex(2023, 0).next(2).getName(), '上半年');
      expect(SolarHalfYear.fromIndex(2023, 0).next(2).toString(), '2024年上半年');
    });

    test('test4 - 向后推移2个半年', () {
      expect(SolarHalfYear.fromIndex(2023, 0).next(-2).getName(), '上半年');
      expect(SolarHalfYear.fromIndex(2023, 0).next(-2).toString(), '2022年上半年');
    });

    test('test5 - 大跨度推移', () {
      expect(SolarHalfYear.fromIndex(2023, 0).next(-4).toString(), '2021年上半年');
      expect(SolarHalfYear.fromIndex(2023, 0).next(-3).toString(), '2021年下半年');
    });
  });
}
