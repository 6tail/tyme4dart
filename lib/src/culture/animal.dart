import '../loop_tyme.dart';
import 'star/twentyeight/twenty_eight_star.dart';

/// 动物（二十八宿对应的动物）
///
/// Author: 6tail
class Animal extends LoopTyme {
  static const List<String> names = ['蛟', '龙', '貉', '兔', '狐', '虎', '豹', '獬', '牛', '蝠', '鼠', '燕', '猪', '獝', '狼', '狗', '彘', '鸡', '乌', '猴', '猿', '犴', '羊', '獐', '马', '鹿', '蛇', '蚓'];

  Animal(int index) : super(names, index);

  Animal.fromIndex(int index) : this(index);

  Animal.fromName(String name) : super.fromName(names, name);

  @override
  Animal next(int n) => Animal(nextIndex(n));

  /// 二十八宿
  TwentyEightStar getTwentyEightStar() => TwentyEightStar(index);
}
