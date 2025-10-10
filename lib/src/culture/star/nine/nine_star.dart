import '../../../loop_tyme.dart';
import '../../direction.dart';
import '../../element.dart';
import 'dipper.dart';

/// 九星
///
/// Author: 6tail
class NineStar extends LoopTyme {
  static const List<String> names = ['一', '二', '三', '四', '五', '六', '七', '八', '九'];

  NineStar(int index) : super(names, index);

  NineStar.fromIndex(int index) : this(index);

  NineStar.fromName(String name) : super.fromName(names, name);

  @override
  NineStar next(int n) => NineStar(nextIndex(n));

  /// 颜色
  String getColor() => ['白', '黑', '碧', '绿', '黄', '白', '赤', '白', '紫'][index];

  /// 五行
  Element getElement() => Element([4, 2, 0, 0, 2, 3, 3, 2, 1][index]);

  /// 北斗九星
  Dipper getDipper() => Dipper(index);

  /// 方位
  Direction getDirection() => Direction(index);

  @override
  String toString() => '${getName()}${getColor()}${getElement().getName()}';
}
