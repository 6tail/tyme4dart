import '../../abstract_culture.dart';
import '../../enums/side.dart';
import '../../lunar/lunar_day.dart';
import '../../sixtycycle/sixty_cycle.dart';
import '../../sixtycycle/sixty_cycle_day.dart';
import '../direction.dart';
import 'fetus_earth_branch.dart';
import 'fetus_heaven_stem.dart';

/// 逐日胎神
///
/// Author: 6tail
class FetusDay extends AbstractCulture {
  /// 天干六甲胎神
  final FetusHeavenStem fetusHeavenStem;

  /// 地支六甲胎神
  final FetusEarthBranch fetusEarthBranch;

  /// 内外
  late final Side side;

  /// 方位
  late final Direction direction;

  FetusDay(SixtyCycle sixtyCycle)
      : fetusHeavenStem = FetusHeavenStem(sixtyCycle.getHeavenStem().index % 5),
        fetusEarthBranch = FetusEarthBranch(sixtyCycle.getEarthBranch().index % 6) {
    int index = [3, 3, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 6, 6, 6, 6, 6, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, -9, -9, -9, -9, -9, -5, -5, -1, -1, -1, -3, -7, -7, -7, -7, -5, 7, 7, 7, 7, 7, 7, 2, 2, 2, 2, 2, 3, 3, 3, 3][sixtyCycle.index];
    side = Side.fromCode(index < 0 ? 0 : 1)!;
    direction = Direction(index);
  }

  FetusDay.fromLunarDay(LunarDay lunarDay) : this(lunarDay.getSixtyCycle());

  FetusDay.fromSixtyCycleDay(SixtyCycleDay sixtyCycleDay) : this(sixtyCycleDay.getSixtyCycle());

  @override
  String getName() {
    String s = fetusHeavenStem.getName() + fetusEarthBranch.getName();
    if (s == '门门') {
      s = '占大门';
    } else if (s == '碓磨碓') {
      s = '占碓磨';
    } else if (s == '房床床') {
      s = '占房床';
    } else if (s.startsWith('门')) {
      s = '占$s';
    }

    s += ' ';

    if (side == Side.IN) {
      s += '房';
    }
    s += side.getName();

    final directionName = direction.getName();
    if (side == Side.OUT && '北南西东'.contains(directionName)) {
      s += '正';
    }
    s += directionName;
    return s;
  }

  /// 内外
  Side getSide() => side;

  /// 方位
  Direction getDirection() => direction;

  /// 天干六甲胎神
  FetusHeavenStem getFetusHeavenStem() => fetusHeavenStem;

  /// 地支六甲胎神
  FetusEarthBranch getFetusEarthBranch() => fetusEarthBranch;
}
