import '../loop_tyme.dart';
import 'star/seven/seven_star.dart';

/// 星期
///
/// Author: 6tail
class Week extends LoopTyme {
  static const List<String> names = ['日', '一', '二', '三', '四', '五', '六'];

  Week(int index) : super(names, index);

  Week.fromIndex(int index) : this(index);

  Week.fromName(String name) : super.fromName(names, name);

  @override
  Week next(int n) => Week(nextIndex(n));

  /// 七曜
  SevenStar getSevenStar() => SevenStar(index);
}
