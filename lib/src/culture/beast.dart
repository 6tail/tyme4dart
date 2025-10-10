import '../loop_tyme.dart';
import 'zone.dart';

/// 神兽
///
/// Author: 6tail
class Beast extends LoopTyme {
  static const List<String> names = ['青龙', '玄武', '白虎', '朱雀'];

  Beast(int index) : super(names, index);

  Beast.fromIndex(int index) : this(index);

  Beast.fromName(String name) : super.fromName(names, name);

  @override
  Beast next(int n) => Beast(nextIndex(n));

  /// 宫
  Zone getZone() => Zone(index);
}
