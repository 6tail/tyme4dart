import '../solar/solar_time.dart';

/// 童限信息
///
/// Author: 6tail
class ChildLimitInfo {
  /// 开始(即出生)的公历时刻
  final SolarTime startTime;

  /// 结束(即开始起运)的公历时刻
  final SolarTime endTime;

  /// 年数
  final int yearCount;

  /// 月数
  final int monthCount;

  /// 日数
  final int dayCount;

  /// 小时数
  final int hourCount;

  /// 分钟数
  final int minuteCount;

  ChildLimitInfo(
    this.startTime,
    this.endTime,
    this.yearCount,
    this.monthCount,
    this.dayCount,
    this.hourCount,
    this.minuteCount,
  );

  SolarTime getStartTime() => startTime;

  SolarTime getEndTime() => endTime;

  int getYearCount() => yearCount;

  int getMonthCount() => monthCount;

  int getDayCount() => dayCount;

  int getHourCount() => hourCount;

  int getMinuteCount() => minuteCount;
}
