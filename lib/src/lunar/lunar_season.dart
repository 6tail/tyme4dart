import '../loop_tyme.dart';

/// 农历季节
///
/// Author: 6tail
class LunarSeason extends LoopTyme {
  static const List<String> names = ["孟春", "仲春", "季春", "孟夏", "仲夏", "季夏", "孟秋", "仲秋", "季秋", "孟冬", "仲冬", "季冬"];

  LunarSeason(int index) : super(names, index);

  LunarSeason.fromIndex(int index) : this(index);

  LunarSeason.fromName(String name) : super.fromName(names, name);

  @override
  LunarSeason next(int n) {
    return LunarSeason(nextIndex(n));
  }
}
