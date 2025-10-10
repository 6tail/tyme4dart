import '../../../loop_tyme.dart';

/// 十神
///
/// Author: 6tail
class TenStar extends LoopTyme {
  static const List<String> names = ['比肩', '劫财', '食神', '伤官', '偏财', '正财', '七杀', '正官', '偏印', '正印'];

  TenStar(int index) : super(names, index);

  TenStar.fromIndex(int index) : this(index);

  TenStar.fromName(String name) : super.fromName(names, name);

  @override
  TenStar next(int n) => TenStar(nextIndex(n));
}
