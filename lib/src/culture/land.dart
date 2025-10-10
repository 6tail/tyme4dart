import '../loop_tyme.dart';
import 'direction.dart';

/// 九野
///
/// Author: 6tail
class Land extends LoopTyme {
  static const List<String> names = ['玄天', '朱天', '苍天', '阳天', '钧天', '幽天', '颢天', '变天', '炎天'];

  Land(int index) : super(names, index);

  Land.fromIndex(int index) : this(index);

  Land.fromName(String name) : super.fromName(names, name);

  @override
  Land next(int n) => Land(nextIndex(n));

  /// 方位
  Direction getDirection() => Direction(index);
}
