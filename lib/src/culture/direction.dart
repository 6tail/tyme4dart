import '../loop_tyme.dart';
import 'element.dart';
import 'land.dart';

/// 方位
///
/// 依据后天八卦排序（0坎北, 1坤西南, 2震东, 3巽东南, 4中, 5乾西北, 6兑西, 7艮东北, 8离南）
///
/// Author: 6tail
class Direction extends LoopTyme {
  static const List<String> names = ['北', '西南', '东', '东南', '中', '西北', '西', '东北', '南'];

  Direction(int index) : super(names, index);

  Direction.fromIndex(int index) : this(index);

  Direction.fromName(String name) : super.fromName(names, name);

  @override
  Direction next(int n) => Direction(nextIndex(n));

  /// 九野
  Land getLand() => Land(index);

  /// 五行
  Element getElement() => Element([4, 2, 0, 0, 2, 3, 3, 2, 1][index]);
}
