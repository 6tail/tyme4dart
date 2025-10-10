import '../loop_tyme.dart';
import 'direction.dart';

/// 五行
///
/// Author: 6tail
class Element extends LoopTyme {
  static const List<String> names = ['木', '火', '土', '金', '水'];

  Element(int index) : super(names, index);

  Element.fromIndex(int index) : this(index);

  Element.fromName(String name) : super.fromName(names, name);

  @override
  Element next(int n) => Element(nextIndex(n));

  /// 我生者
  Element getReinforce() => next(1);

  /// 我克者
  Element getRestrain() => next(2);

  /// 生我者
  Element getReinforced() => next(-1);

  /// 克我者
  Element getRestrained() => next(-2);

  /// 方位
  Direction getDirection() => Direction([2, 8, 4, 6, 0][index]);
}
