import '../abstract_tyme.dart';
import '../sixtycycle/sixty_cycle.dart';
import '../sixtycycle/sixty_cycle_year.dart';
import 'child_limit.dart';
import 'fortune.dart';

/// 大运（10年1大运）
///
/// Author: 6tail
class DecadeFortune extends AbstractTyme {
  /// 童限
  final ChildLimit childLimit;

  /// 序号
  final int index;

  DecadeFortune(this.childLimit, this.index);

  /// 通过童限初始化
  DecadeFortune.fromChildLimit(ChildLimit childLimit, int index) : this(childLimit, index);

  /// 开始年龄
  int getStartAge() => childLimit.getEndSixtyCycleYear().getYear() - childLimit.getStartSixtyCycleYear().getYear() + 1 + index * 10;

  /// 结束年龄
  int getEndAge() => getStartAge() + 9;

  /// 开始干支年
  SixtyCycleYear getStartSixtyCycleYear() => childLimit.getEndSixtyCycleYear().next(index * 10);

  /// 结束干支年
  SixtyCycleYear getEndSixtyCycleYear() => getStartSixtyCycleYear().next(9);

  /// 干支
  SixtyCycle getSixtyCycle() => childLimit.getEightChar().getMonth().next(childLimit.isForward() ? index + 1 : -index - 1);

  @override
  String getName() => getSixtyCycle().getName();

  @override
  DecadeFortune next(int n) => DecadeFortune.fromChildLimit(childLimit, index + n);

  /// 开始小运
  Fortune getStartFortune() => Fortune.fromChildLimit(childLimit, index * 10);
}
