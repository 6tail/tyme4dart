import '../../loop_tyme.dart';

/// 三候
///
/// Author: 6tail
class ThreePhenology extends LoopTyme {
  static const List<String> names = ['初候', '二候', '三候'];

  ThreePhenology(int index) : super(names, index);

  ThreePhenology.fromIndex(int index) : this(index);

  ThreePhenology.fromName(String name) : super.fromName(names, name);

  @override
  ThreePhenology next(int n) => ThreePhenology(nextIndex(n));
}
