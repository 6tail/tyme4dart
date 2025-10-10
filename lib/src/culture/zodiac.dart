import '../loop_tyme.dart';
import '../sixtycycle/earth_branch.dart';

/// 生肖
///
/// Author: 6tail
class Zodiac extends LoopTyme {
  static const List<String> names = ['鼠', '牛', '虎', '兔', '龙', '蛇', '马', '羊', '猴', '鸡', '狗', '猪'];

  Zodiac(int index) : super(names, index);

  Zodiac.fromIndex(int index) : this(index);

  Zodiac.fromName(String name) : super.fromName(names, name);

  @override
  Zodiac next(int n) => Zodiac.fromIndex(nextIndex(n));

  /// 地支
  EarthBranch getEarthBranch() => EarthBranch(index);
}
