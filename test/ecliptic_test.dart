import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 黄道黑道十二神测试
///
/// Author: 6tail
void main() {
  group('Ecliptic Tests', () {
    test('test0 - 天德（黄道）', () {
      var star = SolarDay.fromYmd(2023, 10, 30).getLunarDay().getTwelveStar();
      expect(star.getName(), '天德');
      expect(star.getEcliptic().getName(), '黄道');
      expect(star.getEcliptic().getLuck().getName(), '吉');

      star = SolarDay.fromYmd(2023, 10, 30).getSixtyCycleDay().getTwelveStar();
      expect(star.getName(), '天德');
      expect(star.getEcliptic().getName(), '黄道');
      expect(star.getEcliptic().getLuck().getName(), '吉');
    });

    test('test1 - 白虎（黑道）', () {
      var star = SolarDay.fromYmd(2023, 10, 19).getLunarDay().getTwelveStar();
      expect(star.getName(), '白虎');
      expect(star.getEcliptic().getName(), '黑道');
      expect(star.getEcliptic().getLuck().getName(), '凶');

      star = SolarDay.fromYmd(2023, 10, 19).getSixtyCycleDay().getTwelveStar();
      expect(star.getName(), '白虎');
      expect(star.getEcliptic().getName(), '黑道');
      expect(star.getEcliptic().getLuck().getName(), '凶');
    });

    test('test2 - 天牢（黑道）', () {
      var star = SolarDay.fromYmd(2023, 10, 7).getLunarDay().getTwelveStar();
      expect(star.getName(), '天牢');
      expect(star.getEcliptic().getName(), '黑道');
      expect(star.getEcliptic().getLuck().getName(), '凶');

      star = SolarDay.fromYmd(2023, 10, 7).getSixtyCycleDay().getTwelveStar();
      expect(star.getName(), '天牢');
      expect(star.getEcliptic().getName(), '黑道');
      expect(star.getEcliptic().getLuck().getName(), '凶');
    });

    test('test3 - 玉堂（黄道）', () {
      var star = SolarDay.fromYmd(2023, 10, 8).getLunarDay().getTwelveStar();
      expect(star.getName(), '玉堂');
      expect(star.getEcliptic().getName(), '黄道');
      expect(star.getEcliptic().getLuck().getName(), '吉');

      star = SolarDay.fromYmd(2023, 10, 8).getSixtyCycleDay().getTwelveStar();
      expect(star.getName(), '玉堂');
      expect(star.getEcliptic().getName(), '黄道');
      expect(star.getEcliptic().getLuck().getName(), '吉');
    });
  });
}
