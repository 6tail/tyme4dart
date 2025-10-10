import '../abstract_tyme.dart';
import '../enums/festival_type.dart';
import '../solar/solar_day.dart';

/// 公历现代节日
///
/// Author: 6tail
class SolarFestival extends AbstractTyme {
  static const List<String> names = ['元旦', '三八妇女节', '植树节', '五一劳动节', '五四青年节', '六一儿童节', '建党节', '八一建军节', '教师节', '国庆节'];

  static String data = '@00001011950@01003081950@02003121979@03005011950@04005041950@05006011950@06007011941@07008011933@08009101985@09010011950';

  /// 类型
  final FestivalType type;

  /// 索引
  final int index;

  /// 公历日
  final SolarDay day;

  /// 名称
  late final String name;

  /// 起始年
  final int startYear;

  SolarFestival(this.type, this.day, this.startYear, String data) : index = int.parse(data.substring(1, 3), radix: 10) {
    name = names[index];
  }

  static SolarFestival? fromIndex(int year, int index) {
    if (index < 0 || index >= names.length) {
      throw ArgumentError('illegal index: $index');
    }
    RegExp pattern = RegExp('@${index.toString().padLeft(2, '0')}\\d{9}');
    RegExpMatch? match = pattern.firstMatch(data);
    if (match == null) {
      return null;
    }
    String dt = match.group(0)!;
    FestivalType type = FestivalType.fromCode(dt.codeUnitAt(3) - '0'.codeUnitAt(0))!;
    if (type != FestivalType.DAY) {
      return null;
    }
    int startYear = int.parse(dt.substring(8), radix: 10);
    return year < startYear ? null : SolarFestival(type, SolarDay(year, int.parse(dt.substring(4, 6), radix: 10), int.parse(dt.substring(6, 8), radix: 10)), startYear, dt);
  }

  static SolarFestival? fromYmd(int year, int month, int day) {
    RegExp pattern = RegExp('@\\d{2}0${month.toString().padLeft(2, '0')}${day.toString().padLeft(2, '0')}\\d{4}');
    RegExpMatch? match = pattern.firstMatch(data);
    if (match == null) {
      return null;
    }
    String dt = match.group(0)!;
    int startYear = int.parse(dt.substring(8), radix: 10);
    return year < startYear ? null : SolarFestival(FestivalType.DAY, SolarDay(year, month, day), startYear, dt);
  }

  @override
  SolarFestival next(int n) {
    int size = names.length;
    int i = index + n;
    return fromIndex((day.getYear() * size + i) ~/ size, indexOfSize(i, size))!;
  }

  FestivalType getType() => type;

  int getIndex() => index;

  SolarDay getDay() => day;

  int getStartYear() => startYear;

  @override
  String getName() => name;

  @override
  String toString() => '$day $name';
}
