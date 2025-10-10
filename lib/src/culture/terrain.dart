import '../loop_tyme.dart';

/// 地势(长生十二神)
///
/// Author: 6tail
class Terrain extends LoopTyme {
  static const List<String> names = ['长生', '沐浴', '冠带', '临官', '帝旺', '衰', '病', '死', '墓', '绝', '胎', '养'];

  Terrain(int index) : super(names, index);

  Terrain.fromIndex(int index) : this(index);

  Terrain.fromName(String name) : super.fromName(names, name);

  @override
  Terrain next(int n) => Terrain(nextIndex(n));
}
