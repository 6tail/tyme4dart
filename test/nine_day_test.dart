import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 数九天测试
///
/// Author: 6tail
void main() {
  group('NineDay Tests', () {
    test('test0 - 2020年12月21日一九第1天', () {
      final d = SolarDay.fromYmd(2020, 12, 21).getNineDay();
      expect(d, isNotNull);
      expect(d!.getName(), '一九');
      expect(d.getNine().toString(), '一九');
      expect(d.toString(), '一九第1天');
    });

    test('test1 - 2020年12月22日一九第2天', () {
      final d = SolarDay.fromYmd(2020, 12, 22).getNineDay();
      expect(d, isNotNull);
      expect(d!.getName(), '一九');
      expect(d.getNine().toString(), '一九');
      expect(d.toString(), '一九第2天');
    });

    test('test2 - 2020年1月7日二九第8天', () {
      final d = SolarDay.fromYmd(2020, 1, 7).getNineDay();
      expect(d, isNotNull);
      expect(d!.getName(), '二九');
      expect(d.getNine().toString(), '二九');
      expect(d.toString(), '二九第8天');
    });

    test('test3 - 2021年1月6日二九第8天', () {
      final d = SolarDay.fromYmd(2021, 1, 6).getNineDay();
      expect(d, isNotNull);
      expect(d!.getName(), '二九');
      expect(d.getNine().toString(), '二九');
      expect(d.toString(), '二九第8天');
    });

    test('test4 - 2021年1月8日三九第1天', () {
      final d = SolarDay.fromYmd(2021, 1, 8).getNineDay();
      expect(d, isNotNull);
      expect(d!.getName(), '三九');
      expect(d.getNine().toString(), '三九');
      expect(d.toString(), '三九第1天');
    });

    test('test5 - 2021年3月5日九九第3天', () {
      final d = SolarDay.fromYmd(2021, 3, 5).getNineDay();
      expect(d, isNotNull);
      expect(d!.getName(), '九九');
      expect(d.getNine().toString(), '九九');
      expect(d.toString(), '九九第3天');
    });

    test('test6 - 2021年7月5日不在数九期', () {
      final d = SolarDay.fromYmd(2021, 7, 5).getNineDay();
      expect(d, isNull);
    });
  });
}
