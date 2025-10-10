import '../abstract_tyme.dart';
import '../culture/week.dart';
import 'solar_day.dart';
import 'solar_month.dart';

/// 公历周
///
/// Author: 6tail
class SolarWeek extends AbstractTyme {
  static const List<String> names = ['第一周', '第二周', '第三周', '第四周', '第五周', '第六周'];

  /// 公历月
  late final SolarMonth month;

  /// 索引，0-5
  final int index;

  /// 起始星期
  late final Week start;

  SolarWeek(int year, int month, this.index, int start) {
    if (index < 0 || index > 5) {
      throw ArgumentError('illegal solar week index: $index');
    }
    if (start < 0 || start > 6) {
      throw ArgumentError('illegal solar week start: $start');
    }
    SolarMonth m = SolarMonth(year, month);
    if (index >= m.getWeekCount(start)) {
      throw ArgumentError('illegal solar week index: $index in month: $m');
    }
    this.month = m;
    this.start = Week(start);
  }

  SolarWeek.fromYm(int year, int month, int index, int start) : this(year, month, index, start);

  /// 公历月
  SolarMonth getSolarMonth() => month;

  /// 年
  int getYear() => month.getYear();

  /// 月
  int getMonth() => month.getMonth();

  /// 索引，0-5
  int getIndex() => index;

  /// 位于当年的索引
  int getIndexInYear() {
    int i = 0;
    SolarDay firstDay = getFirstDay();
    // 今年第1周
    SolarWeek w = SolarWeek.fromYm(getYear(), 1, 0, start.getIndex());
    while (w.getFirstDay() != firstDay) {
      w = w.next(1);
      i++;
    }
    return i;
  }

  /// 起始星期
  Week getStart() => start;

  @override
  String getName() => names[index];

  @override
  String toString() => '$month${getName()}';

  @override
  SolarWeek next(int n) {
    int startIndex = start.getIndex();
    int d = index;
    SolarMonth m = month;
    if (n > 0) {
      d += n;
      int weekCount = m.getWeekCount(startIndex);
      while (d >= weekCount) {
        d -= weekCount;
        m = m.next(1);
        if (SolarDay.fromYmd(m.getYear(), m.getMonth(), 1).getWeek() != start) {
          d += 1;
        }
        weekCount = m.getWeekCount(startIndex);
      }
    } else if (n < 0) {
      d += n;
      while (d < 0) {
        if (SolarDay.fromYmd(m.getYear(), m.getMonth(), 1).getWeek() != start) {
          d -= 1;
        }
        m = m.next(-1);
        d += m.getWeekCount(startIndex);
      }
    }
    return SolarWeek(m.getYear(), m.getMonth(), d, startIndex);
  }

  /// 第1天的公历日
  SolarDay getFirstDay() {
    SolarDay firstDay = SolarDay.fromYmd(getYear(), getMonth(), 1);
    return firstDay.next(index * 7 - indexOfSize(firstDay.getWeek().getIndex() - start.getIndex(), 7));
  }

  /// 公历日列表
  List<SolarDay> getDays() {
    List<SolarDay> l = [];
    SolarDay d = getFirstDay();
    l.add(d);
    for (int i = 1; i < 7; i++) {
      l.add(d.next(i));
    }
    return l;
  }

  @override
  bool operator ==(Object other) => other is SolarWeek && getFirstDay() == other.getFirstDay();

  @override
  int get hashCode => getFirstDay().hashCode;
}
