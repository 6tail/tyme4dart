import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 六十甲子测试
///
/// Author: 6tail
void main() {
  group('SixtyCycle Tests', () {
    test('test0 - 索引获取', () {
      expect(SixtyCycle.fromIndex(13).getName(), '丁丑');
    });

    test('test1 - 名称获取', () {
      expect(SixtyCycle.fromName('丁丑').getIndex(), 13);
    });

    test('test2 - 五行', () {
      expect(SixtyCycle.fromName('辛酉').getSound().getName(), '石榴木');
      expect(SixtyCycle.fromName('癸酉').getSound().getName(), '剑锋金');
      expect(SixtyCycle.fromName('己亥').getSound().getName(), '平地木');
    });

    test('test3 - 旬', () {
      expect(SixtyCycle.fromName('甲子').getTen().getName(), '甲子');
      expect(SixtyCycle.fromName('乙卯').getTen().getName(), '甲寅');
      expect(SixtyCycle.fromName('癸巳').getTen().getName(), '甲申');
    });

    test('test4 - 旬空', () {
      var extraBranches = SixtyCycle.fromName('甲子').getExtraEarthBranches();
      expect(extraBranches[0].getName(), '戌');
      expect(extraBranches[1].getName(), '亥');

      extraBranches = SixtyCycle.fromName('乙卯').getExtraEarthBranches();
      expect(extraBranches[0].getName(), '子');
      expect(extraBranches[1].getName(), '丑');

      extraBranches = SixtyCycle.fromName('癸巳').getExtraEarthBranches();
      expect(extraBranches[0].getName(), '午');
      expect(extraBranches[1].getName(), '未');
    });

    test('test5 - 地势（长生十二神）', () {
      expect(HeavenStem.fromName('丙').getTerrain(EarthBranch.fromName('寅')).getName(), '长生');
      expect(HeavenStem.fromName('辛').getTerrain(EarthBranch.fromName('亥')).getName(), '沐浴');
    });
  });
}
