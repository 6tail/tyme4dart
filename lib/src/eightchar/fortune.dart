import '../abstract_tyme.dart';
import '../sixtycycle/sixty_cycle.dart';
import '../sixtycycle/sixty_cycle_year.dart';
import 'child_limit.dart';

/// 小运
///
/// Author: 6tail
class Fortune extends AbstractTyme {
  /// 童限
  final ChildLimit childLimit;

  /// 序号
  final int index;

  Fortune(this.childLimit, this.index);

  /// 通过童限初始化
  Fortune.fromChildLimit(ChildLimit childLimit, int index) : this(childLimit, index);

  /// 年龄
  int getAge() => childLimit.getEndSixtyCycleYear().getYear() - childLimit.getStartSixtyCycleYear().getYear() + 1 + index;

  /// 干支年
  SixtyCycleYear getSixtyCycleYear() => childLimit.getEndSixtyCycleYear().next(index);

  /// 干支
  SixtyCycle getSixtyCycle() {
    int n = getAge();
    return childLimit.getEightChar().getHour().next(childLimit.isForward() ? n : -n);
  }

  @override
  String getName() => getSixtyCycle().getName();

  @override
  Fortune next(int n) => Fortune.fromChildLimit(childLimit, index + n);
}
