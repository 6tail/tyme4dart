import '../../../loop_tyme.dart';
import '../../animal.dart';
import '../../land.dart';
import '../../luck.dart';
import '../../zone.dart';
import '../seven/seven_star.dart';

/// 二十八宿
///
/// Author: 6tail
class TwentyEightStar extends LoopTyme {
  static const List<String> names = ['角', '亢', '氐', '房', '心', '尾', '箕', '斗', '牛', '女', '虚', '危', '室', '壁', '奎', '娄', '胃', '昴', '毕', '觜', '参', '井', '鬼', '柳', '星', '张', '翼', '轸'];

  TwentyEightStar(int index) : super(names, index);

  TwentyEightStar.fromIndex(int index) : this(index);

  TwentyEightStar.fromName(String name) : super.fromName(names, name);

  @override
  TwentyEightStar next(int n) => TwentyEightStar(nextIndex(n));

  /// 七曜
  SevenStar getSevenStar() => SevenStar(index % 7 + 4);

  /// 九野
  Land getLand() => Land([4, 4, 4, 2, 2, 2, 7, 7, 7, 0, 0, 0, 0, 5, 5, 5, 6, 6, 6, 1, 1, 1, 8, 8, 8, 3, 3, 3][index]);

  /// 宫
  Zone getZone() => Zone(index ~/ 7);

  /// 动物
  Animal getAnimal() => Animal(index);

  /// 吉凶
  Luck getLuck() => Luck([0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0][index]);
}
