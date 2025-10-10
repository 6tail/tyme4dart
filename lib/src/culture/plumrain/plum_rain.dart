import '../../loop_tyme.dart';

/// 梅雨
///
/// Author: 6tail
class PlumRain extends LoopTyme {
  static const List<String> names = ['入梅', '出梅'];

  PlumRain(int index) : super(names, index);

  PlumRain.fromIndex(int index) : this(index);

  PlumRain.fromName(String name) : super.fromName(names, name);

  @override
  PlumRain next(int n) => PlumRain(nextIndex(n));
}
