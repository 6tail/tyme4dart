import '../../loop_tyme.dart';
import '../element.dart';
import '../luck.dart';

/// 小六壬
///
/// Author: 6tail
class MinorRen extends LoopTyme {
  static const List<String> names = ['大安', '留连', '速喜', '赤口', '小吉', '空亡'];

  MinorRen(int index) : super(names, index);

  MinorRen.fromIndex(int index) : this(index);

  MinorRen.fromName(String name) : super.fromName(names, name);

  @override
  MinorRen next(int n) => MinorRen(nextIndex(n));

  /// 吉凶
  Luck getLuck() => Luck(index % 2);

  /// 五行
  Element getElement() => Element([0, 4, 1, 3, 0, 2][index]);
}
