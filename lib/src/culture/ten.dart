import '../loop_tyme.dart';

/// 旬
///
/// Author: 6tail
class Ten extends LoopTyme {
  static const List<String> names = ['甲子', '甲戌', '甲申', '甲午', '甲辰', '甲寅'];

  Ten(int index) : super(names, index);

  Ten.fromIndex(int index) : this(index);

  Ten.fromName(String name) : super.fromName(names, name);

  @override
  Ten next(int n) => Ten(nextIndex(n));
}
