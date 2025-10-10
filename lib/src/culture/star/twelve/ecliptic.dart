import '../../../loop_tyme.dart';
import '../../luck.dart';

/// 黄道黑道
///
/// Author: 6tail
class Ecliptic extends LoopTyme {
  static const List<String> names = ['黄道', '黑道'];

  Ecliptic(int index) : super(names, index);

  Ecliptic.fromIndex(int index) : this(index);

  Ecliptic.fromName(String name) : super.fromName(names, name);

  @override
  Ecliptic next(int n) => Ecliptic(nextIndex(n));

  /// 吉凶
  Luck getLuck() => Luck(index);
}
