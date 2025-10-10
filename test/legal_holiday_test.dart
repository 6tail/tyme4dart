import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 法定节假日测试
void main() {
  group('LegalHoliday Tests', () {
    test('test0 - 2011年5月1日劳动节及推移', () {
      LegalHoliday? d = LegalHoliday.fromYmd(2011, 5, 1);
      expect(d, isNotNull);
      expect(d.toString(), equals('2011年5月1日 劳动节(休)'));

      expect(d!.next(1).toString(), equals('2011年5月2日 劳动节(休)'));
      expect(d.next(2).toString(), equals('2011年6月4日 端午节(休)'));
      expect(d.next(-1).toString(), equals('2011年4月30日 劳动节(休)'));
      expect(d.next(-2).toString(), equals('2011年4月5日 清明节(休)'));
    });

    test('test1 - 2010年1月1日', () {
      LegalHoliday? d = LegalHoliday.fromYmd(2010, 1, 1);
      expect(d, isNotNull);
    });

    test('test2 - 2010年1月1日（重复测试）', () {
      LegalHoliday? d = LegalHoliday.fromYmd(2010, 1, 1);
      expect(d, isNotNull);
    });

    test('test3 - 2001年12月29日元旦节(班)', () {
      LegalHoliday? d = LegalHoliday.fromYmd(2001, 12, 29);
      expect(d, isNotNull);
      expect(d.toString(), equals('2001年12月29日 元旦节(班)'));
      expect(d!.next(-1), isNull);
    });

    test('test4 - 2022年10月5日国庆节及推移', () {
      LegalHoliday? d = LegalHoliday.fromYmd(2022, 10, 5);
      expect(d, isNotNull);
      expect(d.toString(), equals('2022年10月5日 国庆节(休)'));
      expect(d!.next(-1).toString(), equals('2022年10月4日 国庆节(休)'));
      expect(d.next(1).toString(), equals('2022年10月6日 国庆节(休)'));
    });

    test('test5 - 从SolarDay获取法定假日', () {
      LegalHoliday? d = SolarDay.fromYmd(2010, 10, 1).getLegalHoliday();
      expect(d, isNotNull);
      expect(d.toString(), equals('2010年10月1日 国庆节(休)'));
    });

    test('test6 - 2025年1月26日春节(班)及目标日期', () {
      LegalHoliday? d = SolarDay.fromYmd(2025, 1, 26).getLegalHoliday();
      expect(d, isNotNull);
      expect(d.toString(), equals('2025年1月26日 春节(班)'));
      expect(d!.getTarget().toString(), equals('2025年1月29日'));
    });
  });
}
