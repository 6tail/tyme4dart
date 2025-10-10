import '../culture/direction.dart';
import '../culture/element.dart';
import '../culture/pengzu/pengzu_heaven_stem.dart';
import '../culture/star/ten/ten_star.dart';
import '../culture/terrain.dart';
import '../enums/yin_yang.dart';
import '../loop_tyme.dart';
import 'earth_branch.dart';

/// 天干（天元）
///
/// Author: 6tail
class HeavenStem extends LoopTyme {
  /// 天干名称
  static const List<String> names = ['甲', '乙', '丙', '丁', '戊', '己', '庚', '辛', '壬', '癸'];

  HeavenStem(int index) : super(names, index);

  HeavenStem.fromIndex(int index) : this(index);

  HeavenStem.fromName(String name) : super.fromName(names, name);

  @override
  HeavenStem next(int n) {
    return HeavenStem(nextIndex(n));
  }

  /// 五行
  Element getElement() => Element(index ~/ 2);

  /// 阴阳
  YinYang getYinYang() => index % 2 == 0 ? YinYang.YANG : YinYang.YIN;

  /// 十神（生我者，正印偏印。我生者，伤官食神。克我者，正官七杀。我克者，正财偏财。同我者，劫财比肩）
  TenStar? getTenStar(HeavenStem? target) {
    if (target == null) {
      return null;
    }
    int targetIndex = target.index;
    int offset = targetIndex - index;
    if (index % 2 != 0 && targetIndex % 2 == 0) {
      offset += 2;
    }
    return TenStar(offset);
  }

  /// 方位
  Direction getDirection() => getElement().getDirection();

  /// 喜神方位（《喜神方位歌》甲己在艮乙庚乾，丙辛坤位喜神安。丁壬只在离宫坐，戊癸原在在巽间）
  Direction getJoyDirection() => Direction([7, 5, 1, 8, 3][index % 5]);

  /// 阳贵神方位（《阳贵神歌》甲戊坤艮位，乙己是坤坎，庚辛居离艮，丙丁兑与乾，震巽属何日，壬癸贵神安）
  Direction getYangDirection() => Direction([1, 1, 6, 5, 7, 0, 8, 7, 2, 3][index]);

  /// 阴贵神方位（《阴贵神歌》甲戊见牛羊，乙己鼠猴乡，丙丁猪鸡位，壬癸蛇兔藏，庚辛逢虎马，此是贵神方）
  Direction getYinDirection() => Direction([7, 0, 5, 6, 1, 1, 7, 8, 3, 2][index]);

  /// 财神方位（《财神方位歌》甲乙东北是财神，丙丁向在西南寻，戊己正北坐方位，庚辛正东去安身，壬癸原来正南坐，便是财神方位真）
  Direction getWealthDirection() => Direction([7, 1, 0, 2, 8][index ~/ 2]);

  /// 福神方位（《福神方位歌》甲乙东南是福神，丙丁正东是堪宜，戊北己南庚辛坤，壬在乾方癸在西）
  Direction getMascotDirection() => Direction([3, 3, 2, 2, 0, 8, 1, 1, 5, 6][index]);

  /// 天干彭祖百忌
  PengZuHeavenStem getPengZuHeavenStem() => PengZuHeavenStem(index);

  /// 地势(长生十二神)
  Terrain getTerrain(EarthBranch earthBranch) {
    int earthBranchIndex = earthBranch.index;
    return Terrain.fromIndex([1, 6, 10, 9, 10, 9, 7, 0, 4, 3][index] + (YinYang.YANG == getYinYang() ? earthBranchIndex : -earthBranchIndex));
  }

  /// 五合（甲己合，乙庚合，丙辛合，丁壬合，戊癸合）
  HeavenStem getCombine() => next(5);

  /// 与[target]目标天干合化（甲己合化土，乙庚合化金，丙辛合化水，丁壬合化木，戊癸合化火）
  Element? combine(HeavenStem target) => getCombine() == target ? Element.fromIndex(index + 2) : null;
}
