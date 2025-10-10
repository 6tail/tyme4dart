import '../loop_tyme.dart';

/// 吉凶
///
/// Author: 6tail
class Luck extends LoopTyme {
  static const List<String> names = ['吉', '凶'];

  Luck(int index) : super(names, index);

  Luck.fromIndex(int index) : this(index);

  Luck.fromName(String name) : super.fromName(names, name);

  @override
  Luck next(int n) => Luck(nextIndex(n));
}
