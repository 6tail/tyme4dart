import '../../../loop_tyme.dart';
import 'ecliptic.dart';

/// 黄道黑道十二神
///
/// Author: 6tail
class TwelveStar extends LoopTyme {
  static const List<String> names = ['青龙', '明堂', '天刑', '朱雀', '金匮', '天德', '白虎', '玉堂', '天牢', '玄武', '司命', '勾陈'];

  TwelveStar(int index) : super(names, index);

  TwelveStar.fromIndex(int index) : this(index);

  TwelveStar.fromName(String name) : super.fromName(names, name);

  @override
  TwelveStar next(int n) => TwelveStar(nextIndex(n));

  /// 黄道黑道
  Ecliptic getEcliptic() => Ecliptic([0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1][index]);
}
