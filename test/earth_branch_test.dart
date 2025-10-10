import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 地支测试
/// 
/// Author: 6tail
void main() {
  group('EarthBranch Tests', () {
    test('test0 - 索引获取', () {
      expect(EarthBranch.fromIndex(0).getName(), '子');
      expect(EarthBranch.fromIndex(1).getName(), '丑');
      expect(EarthBranch.fromIndex(11).getName(), '亥');
    });

    test('test1 - 名称获取', () {
      expect(EarthBranch.fromName('子').getIndex(), 0);
      expect(EarthBranch.fromName('丑').getIndex(), 1);
      expect(EarthBranch.fromName('亥').getIndex(), 11);
    });

    test('test2 - 阴阳属性', () {
      expect(EarthBranch.fromName('子').getYinYang(), YinYang.YANG);
      expect(EarthBranch.fromName('丑').getYinYang(), YinYang.YIN);
      expect(EarthBranch.fromName('寅').getYinYang(), YinYang.YANG);
      expect(EarthBranch.fromName('卯').getYinYang(), YinYang.YIN);
    });

    test('test3 - 五行属性', () {
      expect(EarthBranch.fromName('子').getElement().getName(), '水');
      expect(EarthBranch.fromName('寅').getElement().getName(), '木');
      expect(EarthBranch.fromName('巳').getElement().getName(), '火');
      expect(EarthBranch.fromName('申').getElement().getName(), '金');
      expect(EarthBranch.fromName('辰').getElement().getName(), '土');
    });

    test('test4 - 生肖对应', () {
      expect(EarthBranch.fromName('子').getZodiac().getName(), '鼠');
      expect(EarthBranch.fromName('丑').getZodiac().getName(), '牛');
      expect(EarthBranch.fromName('寅').getZodiac().getName(), '虎');
      expect(EarthBranch.fromName('卯').getZodiac().getName(), '兔');
    });

    test('test5 - 藏干（本气）', () {
      var branch = EarthBranch.fromName('寅');
      expect(branch.getHideHeavenStemMain().getName(), '甲');
    });

    test('test6 - 藏干（中气）', () {
      var branch = EarthBranch.fromName('寅');
      var middle = branch.getHideHeavenStemMiddle();
      expect(middle?.getName(), '丙');
    });

    test('test7 - 藏干（余气）', () {
      var branch = EarthBranch.fromName('寅');
      var residual = branch.getHideHeavenStemResidual();
      expect(residual?.getName(), '戊');
    });

    test('test8 - 推移计算', () {
      expect(EarthBranch.fromName('子').next(1).getName(), '丑');
      expect(EarthBranch.fromName('子').next(12).getName(), '子');
      expect(EarthBranch.fromName('亥').next(1).getName(), '子');
      expect(EarthBranch.fromName('子').next(-1).getName(), '亥');
    });

    test('test9 - 方位计算', () {
      expect(EarthBranch.fromName('子').getDirection().getName(), '北');
      expect(EarthBranch.fromName('卯').getDirection().getName(), '东');
      expect(EarthBranch.fromName('午').getDirection().getName(), '南');
      expect(EarthBranch.fromName('酉').getDirection().getName(), '西');
    });

    test('test10 - 六冲（相冲）', () {
      expect(EarthBranch.fromName('子').getOpposite().getName(), '午');
      expect(EarthBranch.fromName('戌').getOpposite().getName(), '辰');
    });

    test('test11 - 六合', () {
      expect(EarthBranch.fromName('子').getCombine().getName(), '丑');
      expect(EarthBranch.fromName('申').getCombine().getName(), '巳');
    });

    test('test12 - 六害', () {
      expect(EarthBranch.fromName('巳').getHarm().getName(), '寅');
      expect(EarthBranch.fromName('申').getHarm().getName(), '亥');
    });

    test('test13 - 合化', () {
      expect(EarthBranch.fromName('卯').combine(EarthBranch.fromName('戌'))?.getName(), '火');
      expect(EarthBranch.fromName('戌').combine(EarthBranch.fromName('卯'))?.getName(), '火');
      // 卯子无法合化
      expect(EarthBranch.fromName('卯').combine(EarthBranch.fromName('子')), isNull);
    });
  });
}

