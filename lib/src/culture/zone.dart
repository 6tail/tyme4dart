import '../loop_tyme.dart';
import 'beast.dart';
import 'direction.dart';

/// 宫（二十八宿分为四宫，也叫四象、四陆）
///
/// Author: 6tail
class Zone extends LoopTyme {
  static const List<String> names = ['东', '北', '西', '南'];

  Zone(int index) : super(names, index);

  Zone.fromIndex(int index) : this(index);

  Zone.fromName(String name) : super.fromName(names, name);

  @override
  Zone next(int n) => Zone(nextIndex(n));

  /// 方位
  Direction getDirection() => Direction.fromName(getName());

  /// 神兽
  Beast getBeast() => Beast(index);
}
