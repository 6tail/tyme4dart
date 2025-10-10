import '../../loop_tyme.dart';

/// 地支六甲胎神
///
/// Author: 6tail
class FetusEarthBranch extends LoopTyme {
  static const List<String> names = ['碓', '厕', '炉', '门', '栖', '床'];

  FetusEarthBranch(int index) : super(names, index);

  FetusEarthBranch.fromIndex(int index) : this(index);

  FetusEarthBranch.fromName(String name) : super.fromName(names, name);

  @override
  FetusEarthBranch next(int n) => FetusEarthBranch(nextIndex(n));
}
