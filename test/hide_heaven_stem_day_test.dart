import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 人元司令分野测试
///
/// Author: 6tail
void main() {
  group('HideHeavenStemDay Tests', () {
    test('test0', () {
      var d = SolarDay.fromYmd(2024, 12, 4).getHideHeavenStemDay();
      expect(d.getHideHeavenStem().getType().getName(), '本气');
      expect(d.getHideHeavenStem().getName(), '壬');
      expect(d.getHideHeavenStem().toString(), '壬');
      expect(d.getHideHeavenStem().getHeavenStem().getElement().getName(), '水');

      expect(d.getName(), '壬水');
      expect(d.getDayIndex(), 15);
      expect(d.toString(), '壬水第16天');
    });

    test('test1', () {
      var d = SolarDay.fromYmd(2024, 11, 7).getHideHeavenStemDay();
      expect(d.getHideHeavenStem().getType().getName(), '余气');
      expect(d.getHideHeavenStem().getName(), '戊');
      expect(d.getHideHeavenStem().toString(), '戊');
      expect(d.getHideHeavenStem().getHeavenStem().getElement().getName(), '土');

      expect(d.getName(), '戊土');
      expect(d.getDayIndex(), 0);
      expect(d.toString(), '戊土第1天');
    });
  });
}
