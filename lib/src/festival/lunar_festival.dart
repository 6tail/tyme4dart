import '../abstract_tyme.dart';
import '../enums/festival_type.dart';
import '../lunar/lunar_day.dart';
import '../solar/solar_term.dart';

/// 农历传统节日（依据国家标准《农历的编算和颁行》GB/T 33661-2017）
///
/// Author: 6tail
class LunarFestival extends AbstractTyme {
  static const List<String> names = ['春节', '元宵节', '龙头节', '上巳节', '清明节', '端午节', '七夕节', '中元节', '中秋节', '重阳节', '冬至节', '腊八节', '除夕'];

  static String data = '@0000101@0100115@0200202@0300303@04107@0500505@0600707@0700715@0800815@0900909@10124@1101208@122';

  /// 类型
  final FestivalType type;

  /// 索引
  final int index;

  /// 农历日
  final LunarDay day;

  /// 节气
  final SolarTerm? solarTerm;

  /// 名称
  late final String name;

  LunarFestival(this.type, this.day, this.solarTerm, String data) : index = int.parse(data.substring(1, 3), radix: 10) {
    name = names[index];
  }

  @override
  LunarFestival next(int n) {
    int size = names.length;
    int i = index + n;
    return fromIndex((day.getYear() * size + i) ~/ size, indexOfSize(i, size))!;
  }

  static LunarFestival? fromIndex(int year, int index) {
    if (index < 0 || index >= names.length) {
      throw ArgumentError('illegal index: $index');
    }
    RegExp pattern = RegExp('@${index.toString().padLeft(2, '0')}\\d+');
    RegExpMatch? match = pattern.firstMatch(data);
    if (match == null) {
      return null;
    }
    String dt = match.group(0)!;
    FestivalType type = FestivalType.fromCode(dt.codeUnitAt(3) - '0'.codeUnitAt(0))!;
    switch (type) {
      case FestivalType.DAY:
        return LunarFestival(type, LunarDay(year, int.parse(dt.substring(4, 6), radix: 10), int.parse(dt.substring(6), radix: 10)), null, dt);
      case FestivalType.TERM:
        final solarTerm = SolarTerm(year, int.parse(dt.substring(4), radix: 10));
        return LunarFestival(type, solarTerm.getSolarDay().getLunarDay(), solarTerm, dt);
      case FestivalType.EVE:
        return LunarFestival(type, LunarDay(year + 1, 1, 1).next(-1), null, dt);
    }
  }

  static LunarFestival? fromYmd(int year, int month, int day) {
    RegExp pattern = RegExp('@\\d{2}0${month.toString().padLeft(2, '0')}${day.toString().padLeft(2, '0')}');
    RegExpMatch? match = pattern.firstMatch(data);
    if (match != null) {
      return LunarFestival(FestivalType.DAY, LunarDay(year, month, day), null, match.group(0)!);
    }

    pattern = RegExp('@\\d{2}1\\d{2}');
    Iterable<RegExpMatch> matches = pattern.allMatches(data);
    for (RegExpMatch match in matches) {
      String dt = match.group(0)!;
      SolarTerm solarTerm = SolarTerm(year, int.parse(dt.substring(4), radix: 10));
      LunarDay lunarDay = solarTerm.getSolarDay().getLunarDay();
      if (lunarDay.getYear() == year && lunarDay.getMonth() == month && lunarDay.getDay() == day) {
        return LunarFestival(FestivalType.TERM, lunarDay, solarTerm, dt);
      }
    }

    pattern = RegExp('@\\d{2}2');
    match = pattern.firstMatch(data);
    if (match == null) {
      return null;
    }
    LunarDay lunarDay = LunarDay(year, month, day);
    LunarDay nextDay = lunarDay.next(1);
    return nextDay.getMonth() == 1 && nextDay.getDay() == 1 ? LunarFestival(FestivalType.EVE, lunarDay, null, match.group(0)!) : null;
  }

  @override
  String getName() => name;

  /// 类型
  FestivalType getType() => type;

  /// 索引
  int getIndex() => index;

  /// 农历日
  LunarDay getDay() => day;

  /// 节气
  SolarTerm? getSolarTerm() => solarTerm;

  @override
  String toString() => '$day $name';
}
