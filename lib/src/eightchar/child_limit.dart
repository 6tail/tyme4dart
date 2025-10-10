import '../enums/gender.dart';
import '../enums/yin_yang.dart';
import '../sixtycycle/sixty_cycle_year.dart';
import '../solar/solar_term.dart';
import '../solar/solar_time.dart';
import 'child_limit_info.dart';
import 'decade_fortune.dart';
import 'eight_char.dart';
import 'fortune.dart';
import 'provider/child_limit_provider.dart';
import 'provider/impl/default_child_limit_provider.dart';

/// 童限（从出生到起运的时间段）
///
/// Author: 6tail
class ChildLimit {
  /// 童限计算接口
  static ChildLimitProvider provider = DefaultChildLimitProvider();

  /// 八字
  late final EightChar eightChar;

  /// 性别
  late final Gender gender;

  /// 顺逆
  late final bool forward;

  /// 童限信息
  late final ChildLimitInfo info;

  ChildLimit(SolarTime birthTime, this.gender) {
    eightChar = birthTime.getLunarHour().getEightChar();
    // 阳男阴女顺推，阴男阳女逆推
    bool yang = YinYang.YANG == eightChar.getYear().getHeavenStem().getYinYang();
    bool man = Gender.MAN == gender;
    forward = (yang && man) || (!yang && !man);
    SolarTerm term = birthTime.getTerm();
    if (!term.isJie()) {
      term = term.next(-1);
    }
    if (forward) {
      term = term.next(2);
    }
    info = provider.getInfo(birthTime, term);
  }

  ChildLimit.fromSolarTime(SolarTime birthTime, Gender gender) : this(birthTime, gender);

  /// 八字
  EightChar getEightChar() => eightChar;

  /// 性别
  Gender getGender() => gender;

  /// 是否顺推
  bool isForward() => forward;

  /// 年数
  int getYearCount() => info.getYearCount();

  /// 月数
  int getMonthCount() => info.getMonthCount();

  /// 日数
  int getDayCount() => info.getDayCount();

  /// 小时数
  int getHourCount() => info.getHourCount();

  /// 分钟数
  int getMinuteCount() => info.getMinuteCount();

  /// 开始(即出生)的公历时刻
  SolarTime getStartTime() => info.getStartTime();

  /// 结束(即开始起运)的公历时刻
  SolarTime getEndTime() => info.getEndTime();

  /// 起运大运
  DecadeFortune getStartDecadeFortune() => DecadeFortune.fromChildLimit(this, 0);

  /// 所属大运
  DecadeFortune getDecadeFortune() => DecadeFortune.fromChildLimit(this, -1);

  /// 小运
  Fortune getStartFortune() => Fortune.fromChildLimit(this, 0);

  /// 开始(即出生)干支年
  SixtyCycleYear getStartSixtyCycleYear() => SixtyCycleYear.fromYear(getStartTime().getYear());

  /// 结束(即起运)干支年
  SixtyCycleYear getEndSixtyCycleYear() => SixtyCycleYear.fromYear(getEndTime().getYear());

  /// 开始年龄
  int getStartAge() => 1;

  /// 结束年龄
  int getEndAge() {
    int n = getEndSixtyCycleYear().getYear() - getStartSixtyCycleYear().getYear();
    return n > 1 ? n : 1;
  }
}
