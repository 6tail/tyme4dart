import '../abstract_tyme.dart';
import '../culture/zodiac.dart';
import '../sixtycycle/sixty_cycle.dart';
import '../solar/solar_year.dart';
import 'rab_byung_element.dart';
import 'rab_byung_month.dart';

/// 藏历年(公历1027年为藏历元年，第一饶迥火兔年）
///
/// Author: 6tail
class RabByungYear extends AbstractTyme {
  /// 饶迥(胜生周)序号，从0开始
  final int rabByungIndex;

  /// 干支
  final SixtyCycle sixtyCycle;

  RabByungYear(this.rabByungIndex, this.sixtyCycle) {
    if (rabByungIndex < 0 || rabByungIndex > 150) {
      throw ArgumentError('illegal rab-byung index: $rabByungIndex');
    }
  }

  RabByungYear.fromSixtyCycle(int rabByungIndex, SixtyCycle sixtyCycle) : this(rabByungIndex, sixtyCycle);

  static RabByungYear fromElementZodiac(int rabByungIndex, RabByungElement element, Zodiac zodiac) {
    for (int i = 0; i < 60; i++) {
      SixtyCycle sixtyCycle = SixtyCycle.fromIndex(i);
      if (sixtyCycle.getEarthBranch().getZodiac() == zodiac && sixtyCycle.getHeavenStem().getElement().getIndex() == element.getIndex()) {
        return RabByungYear(rabByungIndex, sixtyCycle);
      }
    }
    throw ArgumentError('illegal rab-byung element $element, zodiac $zodiac');
  }

  RabByungYear.fromYear(int year) : this((year - 1024) ~/ 60, SixtyCycle.fromIndex(year - 4));

  /// 饶迥序号
  int getRabByungIndex() => rabByungIndex;

  /// 干支
  SixtyCycle getSixtyCycle() => sixtyCycle;

  /// 生肖
  Zodiac getZodiac() => sixtyCycle.getEarthBranch().getZodiac();

  /// 五行
  RabByungElement getElement() => RabByungElement.fromIndex(sixtyCycle.getHeavenStem().getElement().getIndex());

  @override
  String getName() {
    const digits = ['零', '一', '二', '三', '四', '五', '六', '七', '八', '九'];
    const units = ['', '十', '百'];
    int n = rabByungIndex + 1;
    String s = '';
    int pos = 0;
    while (n > 0) {
      int digit = n % 10;
      if (digit > 0) {
        s = digits[digit] + units[pos] + s;
      } else if (s.isNotEmpty) {
        s = digits[digit] + s;
      }
      n ~/= 10;
      pos++;
    }
    String letter = s;
    if (letter.startsWith('一十')) {
      letter = letter.substring(1);
    }
    return '第$letter饶迥${getElement()}${getZodiac()}年';
  }

  @override
  RabByungYear next(int n) => RabByungYear.fromYear(getYear() + n);

  /// 年
  int getYear() => 1024 + rabByungIndex * 60 + sixtyCycle.getIndex();

  /// 闰月
  int getLeapMonth() {
    int y = 1;
    int m = 4;
    int t = 0;
    int currentYear = getYear();
    while (y < currentYear) {
      int i = m - 1 + (t % 2 == 0 ? 33 : 32);
      y = (y * 12 + i) ~/ 12;
      m = i % 12 + 1;
      t++;
    }
    return y == currentYear ? m : 0;
  }

  /// 公历年
  SolarYear getSolarYear() => SolarYear(getYear());

  /// 首月
  RabByungMonth getFirstMonth() => RabByungMonth(this, 1);

  /// 月份数量
  int getMonthCount() => getLeapMonth() < 1 ? 12 : 13;

  /// 藏历月列表
  List<RabByungMonth> getMonths() {
    List<RabByungMonth> l = [];
    int leapMonth = getLeapMonth();
    for (int i = 1; i < 13; i++) {
      l.add(RabByungMonth(this, i));
      if (i == leapMonth) {
        l.add(RabByungMonth(this, -i));
      }
    }
    return l;
  }
}
