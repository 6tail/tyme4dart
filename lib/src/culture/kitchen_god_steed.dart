import '../abstract_culture.dart';
import '../lunar/lunar_day.dart';
import '../sixtycycle/sixty_cycle.dart';

/// 灶马头(灶神的坐骑)
///
/// Author: 6tail
class KitchenGodSteed extends AbstractCulture {
  static const List<String> numbers = ['一', '二', '三', '四', '五', '六', '七', '八', '九', '十', '十一', '十二'];

  /// 正月初一的干支
  final SixtyCycle firstDaySixtyCycle;

  KitchenGodSteed(int lunarYear): firstDaySixtyCycle = LunarDay(lunarYear, 1, 1).getSixtyCycle();

  KitchenGodSteed.fromLunarYear(int lunarYear) : this(lunarYear);

  String _byHeavenStem(int n) => numbers[firstDaySixtyCycle.getHeavenStem().stepsTo(n)];

  String _byEarthBranch(int n) => numbers[firstDaySixtyCycle.getEarthBranch().stepsTo(n)];

  /// 几鼠偷粮
  String getMouse() => '${_byEarthBranch(0)}鼠偷粮';

  /// 草子几分
  String getGrass() => '草子${_byEarthBranch(0)}分';

  /// 几牛耕田（正月第一个丑日是初几，就是几牛耕田）
  String getCattle() => '${_byEarthBranch(1)}牛耕田';

  /// 花收几分
  String getFlower() => '花收${_byEarthBranch(3)}分';

  /// 几龙治水（正月第一个辰日是初几，就是几龙治水）
  String getDragon() => '${_byEarthBranch(4)}龙治水';

  /// 几马驮谷
  String getHorse() => '${_byEarthBranch(6)}马驮谷';

  /// 几鸡抢米
  String getChicken() => '${_byEarthBranch(9)}鸡抢米';

  /// 几姑看蚕
  String getSilkworm() => '${_byEarthBranch(9)}姑看蚕';

  /// 几屠共猪
  String getPig() => '${_byEarthBranch(11)}屠共猪';

  /// 甲田几分
  String getField() => '甲田${_byHeavenStem(0)}分';

  /// 几人分饼（正月第一个丙日是初几，就是几人分饼）
  String getCake() => '${_byHeavenStem(2)}人分饼';

  /// 几日得金（正月第一个辛日是初几，就是几日得金）
  String getGold() => '${_byHeavenStem(7)}日得金';

  /// 几人几丙
  String getPeopleCakes() => '${_byEarthBranch(2)}人${_byHeavenStem(2)}丙';

  /// 几人几锄
  String getPeopleHoes() => '${_byEarthBranch(2)}人${_byHeavenStem(3)}锄';

  @override
  String getName() => '灶马头';
}
