import '../loop_tyme.dart';

/// 星座
///
/// Author: 6tail
class Constellation extends LoopTyme {
  static const List<String> names = ['白羊', '金牛', '双子', '巨蟹', '狮子', '处女', '天秤', '天蝎', '射手', '摩羯', '水瓶', '双鱼'];

  Constellation(int index) : super(names, index);

  Constellation.fromIndex(int index) : this(index);

  Constellation.fromName(String name) : super.fromName(names, name);

  @override
  Constellation next(int n) => Constellation(nextIndex(n));
}
