import '../../../loop_tyme.dart';

/// 六曜（孔明六曜星）
///
/// Author: 6tail
class SixStar extends LoopTyme {
  static const List<String> names = ['先胜', '友引', '先负', '佛灭', '大安', '赤口'];

  SixStar(int index) : super(names, index);

  SixStar.fromIndex(int index) : this(index);

  SixStar.fromName(String name) : super.fromName(names, name);

  @override
  SixStar next(int n) => SixStar(nextIndex(n));
}
