import '../../loop_tyme.dart';

/// 数九（以冬至起算的第几九）
///
/// author 6tail
class Nine extends LoopTyme {
  static const List<String> names = ['一九', '二九', '三九', '四九', '五九', '六九', '七九', '八九', '九九'];

  Nine(int index) : super(names, index);

  Nine.fromIndex(int index) : this(index);

  Nine.fromName(String name) : super.fromName(names, name);

  @override
  Nine next(int n) => Nine(nextIndex(n));
}
