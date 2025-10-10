import '../abstract_tyme.dart';
import '../culture/week.dart';
import 'lunar_day.dart';
import 'lunar_month.dart';

/// 农历周
///
/// Author: 6tail
class LunarWeek extends AbstractTyme {
  static const List<String> names = ["第一周", "第二周", "第三周", "第四周", "第五周", "第六周"];

  /// 月
  late final LunarMonth month;

  /// 索引，0-5
  final int index;

  /// 起始星期
  late final Week start;

  LunarWeek(int year, int month, this.index, int start) {
    if (index < 0 || index > 5) {
      throw ArgumentError('illegal lunar week index: $index');
    }
    if (start < 0 || start > 6) {
      throw ArgumentError('illegal lunar week start: $start');
    }
    LunarMonth m = LunarMonth(year, month);
    if (index >= m.getWeekCount(start)) {
      throw ArgumentError('illegal lunar week index: $index in month: $m');
    }
    this.month = m;
    this.start = Week.fromIndex(start);
  }

  LunarWeek.fromYm(int year, int month, int index, int start) : this(year, month, index, start);

  /// 农历月
  LunarMonth getLunarMonth() => month;

  /// 年
  int getYear() => month.getYear();

  /// 月
  int getMonth() => month.getMonthWithLeap();

  /// 索引，0-5
  int getIndex() => index;

  /// 起始星期
  Week getStart() => start;

  @override
  String getName() => names[index];

  @override
  String toString() => '${month.toString()}${getName()}';

  @override
  LunarWeek next(int n) {
    int startIndex = start.getIndex();
    if (n == 0) {
      return LunarWeek(getYear(), getMonth(), index, startIndex);
    }
    int d = index + n;
    LunarMonth m = month;
    if (n > 0) {
      int weekCount = m.getWeekCount(startIndex);
      while (d >= weekCount) {
        d -= weekCount;
        m = m.next(1);
        if (LunarDay(m.getYear(), m.getMonthWithLeap(), 1).getWeek() != start) {
          d += 1;
        }
        weekCount = m.getWeekCount(startIndex);
      }
    } else {
      while (d < 0) {
        if (LunarDay(m.getYear(), m.getMonthWithLeap(), 1).getWeek() != start) {
          d -= 1;
        }
        m = m.next(-1);
        d += m.getWeekCount(startIndex);
      }
    }
    return LunarWeek(m.getYear(), m.getMonthWithLeap(), d, startIndex);
  }

  /// 本周第1天的农历日
  LunarDay getFirstDay() {
    LunarDay firstDay = LunarDay(getYear(), getMonth(), 1);
    return firstDay.next(index * 7 - indexOfSize(firstDay.getWeek().getIndex() - start.getIndex(), 7));
  }

  /// 本周农历日列表
  List<LunarDay> getDays() {
    List<LunarDay> l = [];
    LunarDay d = getFirstDay();
    l.add(d);
    for (int i = 1; i < 7; i++) {
      l.add(d.next(i));
    }
    return l;
  }

  @override
  bool operator ==(Object other) {
    return other is LunarWeek && getFirstDay() == other.getFirstDay();
  }

  @override
  int get hashCode => getFirstDay().hashCode;
}
