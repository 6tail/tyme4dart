import '../../../loop_tyme.dart';
import '../../week.dart';

/// 七曜（七政、七纬、七耀）
///
/// Author: 6tail
class SevenStar extends LoopTyme {
  static const List<String> names = ['日', '月', '火', '水', '木', '金', '土'];

  SevenStar(int index) : super(names, index);

  SevenStar.fromIndex(int index) : this(index);

  SevenStar.fromName(String name) : super.fromName(names, name);

  @override
  SevenStar next(int n) => SevenStar(nextIndex(n));

  /// 星期
  Week getWeek() => Week(index);
}
