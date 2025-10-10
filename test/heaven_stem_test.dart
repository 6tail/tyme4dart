import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 天干测试
///
/// Author: 6tail
void main() {
  group('HeavenStem Tests', () {
    test('test0 - 索引获取', () {
      expect(HeavenStem.fromIndex(0).getName(), '甲');
      expect(HeavenStem.fromIndex(1).getName(), '乙');
      expect(HeavenStem.fromIndex(9).getName(), '癸');
    });

    test('test1 - 名称获取', () {
      expect(HeavenStem.fromName('甲').getIndex(), 0);
      expect(HeavenStem.fromName('乙').getIndex(), 1);
      expect(HeavenStem.fromName('癸').getIndex(), 9);
    });

    test('test2 - 天干的五行生克', () {
      expect(HeavenStem.fromName('丙').getElement(), HeavenStem.fromName('甲').getElement().getReinforce());
    });

    test('test3 - 十神', () {
      var shiShen = {
        '甲甲': '比肩',
        '甲乙': '劫财',
        '甲丙': '食神',
        '甲丁': '伤官',
        '甲戊': '偏财',
        '甲己': '正财',
        '甲庚': '七杀',
        '甲辛': '正官',
        '甲壬': '偏印',
        '甲癸': '正印',
        '乙乙': '比肩',
        '乙甲': '劫财',
        '乙丁': '食神',
        '乙丙': '伤官',
        '乙己': '偏财',
        '乙戊': '正财',
        '乙辛': '七杀',
        '乙庚': '正官',
        '乙癸': '偏印',
        '乙壬': '正印',
        '丙丙': '比肩',
        '丙丁': '劫财',
        '丙戊': '食神',
        '丙己': '伤官',
        '丙庚': '偏财',
        '丙辛': '正财',
        '丙壬': '七杀',
        '丙癸': '正官',
        '丙甲': '偏印',
        '丙乙': '正印',
        '丁丁': '比肩',
        '丁丙': '劫财',
        '丁己': '食神',
        '丁戊': '伤官',
        '丁辛': '偏财',
        '丁庚': '正财',
        '丁癸': '七杀',
        '丁壬': '正官',
        '丁乙': '偏印',
        '丁甲': '正印',
        '戊戊': '比肩',
        '戊己': '劫财',
        '戊庚': '食神',
        '戊辛': '伤官',
        '戊壬': '偏财',
        '戊癸': '正财',
        '戊甲': '七杀',
        '戊乙': '正官',
        '戊丙': '偏印',
        '戊丁': '正印',
        '己己': '比肩',
        '己戊': '劫财',
        '己辛': '食神',
        '己庚': '伤官',
        '己癸': '偏财',
        '己壬': '正财',
        '己乙': '七杀',
        '己甲': '正官',
        '己丁': '偏印',
        '己丙': '正印',
        '庚庚': '比肩',
        '庚辛': '劫财',
        '庚壬': '食神',
        '庚癸': '伤官',
        '庚甲': '偏财',
        '庚乙': '正财',
        '庚丙': '七杀',
        '庚丁': '正官',
        '庚戊': '偏印',
        '庚己': '正印',
        '辛辛': '比肩',
        '辛庚': '劫财',
        '辛癸': '食神',
        '辛壬': '伤官',
        '辛乙': '偏财',
        '辛甲': '正财',
        '辛丁': '七杀',
        '辛丙': '正官',
        '辛己': '偏印',
        '辛戊': '正印',
        '壬壬': '比肩',
        '壬癸': '劫财',
        '壬甲': '食神',
        '壬乙': '伤官',
        '壬丙': '偏财',
        '壬丁': '正财',
        '壬戊': '七杀',
        '壬己': '正官',
        '壬庚': '偏印',
        '壬辛': '正印',
        '癸癸': '比肩',
        '癸壬': '劫财',
        '癸乙': '食神',
        '癸甲': '伤官',
        '癸丁': '偏财',
        '癸丙': '正财',
        '癸己': '七杀',
        '癸戊': '正官',
        '癸辛': '偏印',
        '癸庚': '正印',
      };
      shiShen.forEach((gz, expected) {
        var me = HeavenStem.fromName(gz.substring(0, 1));
        var target = HeavenStem.fromName(gz.substring(1, 2));
        expect(me.getTenStar(target)?.getName(), expected);
      });
    });

    test('test4 - 天干五合', () {
      expect(HeavenStem.fromName('庚').getCombine().getName(), '乙');
      expect(HeavenStem.fromName('乙').getCombine().getName(), '庚');
      expect(HeavenStem.fromName('甲').combine(HeavenStem.fromName('己'))?.getName(), '土');
      expect(HeavenStem.fromName('己').combine(HeavenStem.fromName('甲'))?.getName(), '土');
      expect(HeavenStem.fromName('丁').combine(HeavenStem.fromName('壬'))?.getName(), '木');
      expect(HeavenStem.fromName('壬').combine(HeavenStem.fromName('丁'))?.getName(), '木');
      expect(HeavenStem.fromName('甲').combine(HeavenStem.fromName('乙')), isNull);
    });
  });
}
