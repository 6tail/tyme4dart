import '../../loop_tyme.dart';

/// 天干六甲胎神
///
/// Author: 6tail
class FetusHeavenStem extends LoopTyme {
  static const List<String> names = ['门', '碓磨', '厨灶', '仓库', '房床'];

  FetusHeavenStem(int index) : super(names, index);

  FetusHeavenStem.fromIndex(int index) : this(index);

  FetusHeavenStem.fromName(String name) : super.fromName(names, name);

  @override
  FetusHeavenStem next(int n) => FetusHeavenStem(nextIndex(n));
}
