import '../../loop_tyme.dart';
import '../../lunar/lunar_month.dart';

/// 逐月胎神
///
/// Author: 6tail
class FetusMonth extends LoopTyme {
  static const List<String> names = ['占房床', '占户窗', '占门堂', '占厨灶', '占房床', '占床仓', '占碓磨', '占厕户', '占门房', '占房床', '占灶炉', '占房床'];

  FetusMonth(int index) : super(names, index);

  FetusMonth.fromIndex(int index) : this(index);

  /// 从农历月初始化
  static FetusMonth? fromLunarMonth(LunarMonth lunarMonth) => lunarMonth.isLeap() ? null : FetusMonth(lunarMonth.month - 1);

  @override
  FetusMonth next(int n) => FetusMonth(nextIndex(n));
}
