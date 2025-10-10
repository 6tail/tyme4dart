import '../culture/direction.dart';
import '../culture/element.dart';
import '../culture/pengzu/pengzu_earth_branch.dart';

// import '../culture/zodiac.dart';
import '../culture/zodiac.dart';
import '../enums/hide_heaven_stem_type.dart';
import '../enums/yin_yang.dart';
import '../loop_tyme.dart';
import 'heaven_stem.dart';
import 'hide_heaven_stem.dart';

/// 地支（地元）
///
/// Author: 6tail
class EarthBranch extends LoopTyme {
  /// 地支名称
  static const List<String> names = ['子', '丑', '寅', '卯', '辰', '巳', '午', '未', '申', '酉', '戌', '亥'];

  EarthBranch(int index) : super(names, index);

  EarthBranch.fromIndex(int index) : this(index);

  EarthBranch.fromName(String name) : super.fromName(names, name);

  @override
  EarthBranch next(int n) {
    return EarthBranch(nextIndex(n));
  }

  /// 五行
  Element getElement() => Element([4, 2, 0, 0, 2, 1, 1, 2, 3, 3, 2, 4][index]);

  /// 阴阳
  YinYang getYinYang() => index % 2 == 0 ? YinYang.YANG : YinYang.YIN;

  /// 藏干之本气
  HeavenStem getHideHeavenStemMain() => HeavenStem([9, 5, 0, 1, 4, 2, 3, 5, 6, 7, 4, 8][index]);

  /// 藏干之中气，无中气返回null
  HeavenStem? getHideHeavenStemMiddle() {
    int n = [-1, 9, 2, -1, 1, 6, 5, 3, 8, -1, 7, 0][index];
    return n == -1 ? null : HeavenStem(n);
  }

  /// 藏干之余气，无余气返回null
  HeavenStem? getHideHeavenStemResidual() {
    int n = [-1, 7, 4, -1, 9, 4, -1, 1, 4, -1, 3, -1][index];
    return n == -1 ? null : HeavenStem.fromIndex(n);
  }

  /// 藏干列表
  List<HideHeavenStem> getHideHeavenStems() {
    List<HideHeavenStem> list = [];
    list.add(HideHeavenStem(getHideHeavenStemMain(), HideHeavenStemType.MAIN));

    HeavenStem? middle = getHideHeavenStemMiddle();
    if (middle != null) {
      list.add(HideHeavenStem(middle, HideHeavenStemType.MIDDLE));
    }

    HeavenStem? residual = getHideHeavenStemResidual();
    if (residual != null) {
      list.add(HideHeavenStem(residual, HideHeavenStemType.RESIDUAL));
    }

    return list;
  }

  /// 生肖
  Zodiac getZodiac() => Zodiac(index);

  /// 方位
  Direction getDirection() => Direction([0, 4, 2, 2, 4, 8, 8, 4, 6, 6, 4, 0][index]);

  /// 煞（逢巳日、酉日、丑日必煞东；亥日、卯日、未日必煞西；申日、子日、辰日必煞南；寅日、午日、戌日必煞北）
  Direction getOminous() => Direction([8, 2, 0, 6][index % 4]);

  /// 地支彭祖百忌
  PengZuEarthBranch getPengZuEarthBranch() => PengZuEarthBranch(index);

  /// 六冲（子午冲，丑未冲，寅申冲，辰戌冲，卯酉冲，巳亥冲）
  EarthBranch getOpposite() => next(6);

  /// 六合（子丑合，寅亥合，卯戌合，辰酉合，巳申合，午未合）
  EarthBranch getCombine() => EarthBranch(1 - index);

  /// 六害（子未害、丑午害、寅巳害、卯辰害、申亥害、酉戌害）
  EarthBranch getHarm() => EarthBranch(19 - index);

  /// 与[target]目标地支合化（子丑合化土，寅亥合化木，卯戌合化火，辰酉合化金，巳申合化水，午未合化土）
  Element? combine(EarthBranch target) => getCombine() == target ? Element.fromIndex([2, 2, 0, 1, 3, 4, 2, 2, 4, 3, 1, 0][index]) : null;
}
