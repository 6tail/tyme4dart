import '../../../loop_tyme.dart';

/// 北斗九星
///
/// Author: 6tail
class Dipper extends LoopTyme {
  static const List<String> names = ['天枢', '天璇', '天玑', '天权', '玉衡', '开阳', '摇光', '洞明', '隐元'];

  Dipper(int index) : super(names, index);

  Dipper.fromIndex(int index) : this(index);

  Dipper.fromName(String name) : super.fromName(names, name);

  @override
  Dipper next(int n) => Dipper(nextIndex(n));
}
