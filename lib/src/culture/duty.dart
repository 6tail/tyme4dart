import '../loop_tyme.dart';

/// 建除十二值神
///
/// Author: 6tail
class Duty extends LoopTyme {
  static const List<String> names = ['建', '除', '满', '平', '定', '执', '破', '危', '成', '收', '开', '闭'];

  Duty(int index) : super(names, index);

  Duty.fromIndex(int index) : this(index);

  Duty.fromName(String name) : super.fromName(names, name);

  @override
  Duty next(int n) => Duty(nextIndex(n));
}
