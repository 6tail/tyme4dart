import '../abstract_tyme.dart';
import '../culture/ren/minor_ren.dart';
import '../culture/star/nine/nine_star.dart';
import '../culture/star/twelve/twelve_star.dart';
import '../culture/taboo.dart';
import '../eightchar/eight_char.dart';
import '../eightchar/provider/eight_char_provider.dart';
import '../eightchar/provider/impl/default_eight_char_provider.dart';
import '../sixtycycle/earth_branch.dart';
import '../sixtycycle/heaven_stem.dart';
import '../sixtycycle/sixty_cycle.dart';
import '../sixtycycle/sixty_cycle_hour.dart';
import '../solar/solar_day.dart';
import '../solar/solar_term.dart';
import '../solar/solar_time.dart';
import 'lunar_day.dart';

/// 农历时辰
///
/// Author: 6tail
class LunarHour extends AbstractTyme {
  /// 八字计算接口
  static EightCharProvider provider = DefaultEightCharProvider();

  /// 农历日
  late final LunarDay day;

  /// 时
  final int hour;

  /// 分
  final int minute;

  /// 秒
  final int second;

  /// 公历时刻（第一次使用时才会初始化）
  SolarTime? solarTime;

  /// 干支时辰（第一次使用时才会初始化）
  SixtyCycleHour? sixtyCycleHour;

  LunarHour(int year, int month, int day, this.hour, this.minute, this.second) {
    if (hour < 0 || hour > 23) {
      throw ArgumentError('illegal hour: $hour');
    }
    if (minute < 0 || minute > 59) {
      throw ArgumentError('illegal minute: $minute');
    }
    if (second < 0 || second > 59) {
      throw ArgumentError('illegal second: $second');
    }
    this.day = LunarDay(year, month, day);
  }

  LunarHour.fromYmdHms(int year, int month, int day, int hour, int minute, int second) : this(year, month, day, hour, minute, second);

  /// 农历日
  LunarDay getLunarDay() => day;

  /// 年
  int getYear() => day.getYear();

  /// 月
  int getMonth() => day.getMonth();

  /// 日
  int getDay() => day.getDay();

  /// 时
  int getHour() => hour;

  /// 分
  int getMinute() => minute;

  /// 秒
  int getSecond() => second;

  @override
  String getName() => '${EarthBranch(getIndexInDay()).getName()}时';

  @override
  String toString() => '$day${getSixtyCycle().getName()}时';

  /// 位于当天的索引
  int getIndexInDay() => (hour + 1) ~/ 2;

  @override
  LunarHour next(int n) {
    if (n == 0) {
      return LunarHour(getYear(), getMonth(), getDay(), hour, minute, second);
    }
    int h = hour + n * 2;
    int diff = h < 0 ? -1 : 1;
    int hours = h.abs();
    int days = hours ~/ 24 * diff;
    hours = (hours % 24) * diff;
    if (hours < 0) {
      hours += 24;
      days--;
    }
    LunarDay d = day.next(days);
    return LunarHour(d.getYear(), d.getMonth(), d.getDay(), hours, minute, second);
  }

  /// 是否在[target]指定农历时辰之前
  bool isBefore(LunarHour target) {
    if (day != target.getLunarDay()) {
      return day.isBefore(target.getLunarDay());
    }
    if (hour != target.getHour()) {
      return hour < target.getHour();
    }
    return minute != target.getMinute() ? minute < target.getMinute() : second < target.getSecond();
  }

  /// 是否在[target]指定农历时辰之后
  bool isAfter(LunarHour target) {
    if (day != target.getLunarDay()) {
      return day.isAfter(target.getLunarDay());
    }
    if (hour != target.getHour()) {
      return hour > target.getHour();
    }
    return minute != target.getMinute() ? minute > target.getMinute() : second > target.getSecond();
  }

  /// 干支
  SixtyCycle getSixtyCycle() {
    int earthBranchIndex = getIndexInDay() % 12;
    SixtyCycle d = day.getSixtyCycle();
    if (hour >= 23) {
      d = d.next(1);
    }
    return SixtyCycle.fromName('${HeavenStem(d.getHeavenStem().index % 5 * 2 + earthBranchIndex).getName()}${EarthBranch(earthBranchIndex).getName()}');
  }

  /// 黄道黑道十二神
  TwelveStar getTwelveStar() => TwelveStar(getSixtyCycle().getEarthBranch().index + (8 - getSixtyCycleHour().getDay().getEarthBranch().index % 6) * 2);

  /// 九星（时家紫白星歌诀：三元时白最为佳，冬至阳生顺莫差，孟日七宫仲一白，季日四绿发萌芽，每把时辰起甲子，本时星耀照光华，时星移入中宫去，顺飞八方逐细查。夏至阴生逆回首，孟归三碧季加六，仲在九宫时起甲，依然掌中逆轮跨。）
  NineStar getNineStar() {
    SolarDay solar = day.getSolarDay();
    SolarTerm dongZhi = SolarTerm(solar.getYear(), 0);
    int earthBranchIndex = getIndexInDay() % 12;
    int index = [8, 5, 2][day.getSixtyCycle().getEarthBranch().index % 3];
    if (!solar.isBefore(dongZhi.getJulianDay().getSolarDay()) && solar.isBefore(dongZhi.next(12).getJulianDay().getSolarDay())) {
      index = 8 + earthBranchIndex - index;
    } else {
      index -= earthBranchIndex;
    }
    return NineStar.fromIndex(index);
  }

  /// 公历时刻
  SolarTime getSolarTime() {
    if (solarTime == null) {
      SolarDay d = day.getSolarDay();
      solarTime = SolarTime.fromYmdHms(d.getYear(), d.getMonth(), d.getDay(), hour, minute, second);
    }
    return solarTime!;
  }

  /// 八字
  EightChar getEightChar() => provider.getEightChar(this);

  /// 干支时辰
  SixtyCycleHour getSixtyCycleHour() {
    sixtyCycleHour ??= getSolarTime().getSixtyCycleHour();
    return sixtyCycleHour!;
  }

  /// 宜
  List<Taboo> getRecommends() => Taboo.getHourRecommends(getSixtyCycleHour().getDay(), getSixtyCycle());

  /// 忌
  List<Taboo> getAvoids() => Taboo.getHourAvoids(getSixtyCycleHour().getDay(), getSixtyCycle());

  /// 小六壬
  MinorRen getMinorRen() => getLunarDay().getMinorRen().next(getIndexInDay());
}
