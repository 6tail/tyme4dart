import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 三伏天测试
///
/// Author: 6tail
void main() {
  group('DogDay Tests', () {
    test('test0 - 2011年7月14日初伏第1天', () {
      final d = SolarDay.fromYmd(2011, 7, 14).getDogDay();
      expect(d, isNotNull);
      expect(d!.getName(), '初伏');
      expect(d.getDog().toString(), '初伏');
      expect(d.toString(), '初伏第1天');
    });

    test('test1 - 2011年7月23日初伏第10天', () {
      final d = SolarDay.fromYmd(2011, 7, 23).getDogDay();
      expect(d, isNotNull);
      expect(d!.getName(), '初伏');
      expect(d.getDog().toString(), '初伏');
      expect(d.toString(), '初伏第10天');
    });

    test('test2 - 2011年7月24日中伏第1天', () {
      final d = SolarDay.fromYmd(2011, 7, 24).getDogDay();
      expect(d, isNotNull);
      expect(d!.getName(), '中伏');
      expect(d.getDog().toString(), '中伏');
      expect(d.toString(), '中伏第1天');
    });

    test('test3 - 2011年8月12日中伏第20天', () {
      final d = SolarDay.fromYmd(2011, 8, 12).getDogDay();
      expect(d, isNotNull);
      expect(d!.getName(), '中伏');
      expect(d.getDog().toString(), '中伏');
      expect(d.toString(), '中伏第20天');
    });

    test('test4 - 2011年8月13日末伏第1天', () {
      final d = SolarDay.fromYmd(2011, 8, 13).getDogDay();
      expect(d, isNotNull);
      expect(d!.getName(), '末伏');
      expect(d.getDog().toString(), '末伏');
      expect(d.toString(), '末伏第1天');
    });

    test('test5 - 2011年8月22日末伏第10天', () {
      final d = SolarDay.fromYmd(2011, 8, 22).getDogDay();
      expect(d, isNotNull);
      expect(d!.getName(), '末伏');
      expect(d.getDog().toString(), '末伏');
      expect(d.toString(), '末伏第10天');
    });

    test('test6 - 2011年7月13日不在三伏期', () {
      expect(SolarDay.fromYmd(2011, 7, 13).getDogDay(), isNull);
    });

    test('test7 - 2011年8月23日不在三伏期', () {
      expect(SolarDay.fromYmd(2011, 8, 23).getDogDay(), isNull);
    });

    test('test8 - 2012年7月18日初伏第1天', () {
      final d = SolarDay.fromYmd(2012, 7, 18).getDogDay();
      expect(d, isNotNull);
      expect(d!.getName(), '初伏');
      expect(d.getDog().toString(), '初伏');
      expect(d.toString(), '初伏第1天');
    });

    test('test9 - 2012年8月5日中伏第9天', () {
      final d = SolarDay.fromYmd(2012, 8, 5).getDogDay();
      expect(d, isNotNull);
      expect(d!.getName(), '中伏');
      expect(d.getDog().toString(), '中伏');
      expect(d.toString(), '中伏第9天');
    });

    test('test10 - 2012年8月8日末伏第2天', () {
      final d = SolarDay.fromYmd(2012, 8, 8).getDogDay();
      expect(d, isNotNull);
      expect(d!.getName(), '末伏');
      expect(d.getDog().toString(), '末伏');
      expect(d.toString(), '末伏第2天');
    });
  });
}
