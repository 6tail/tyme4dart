import '../../loop_tyme.dart';

/// 地支彭祖百忌
///
/// Author: 6tail
class PengZuEarthBranch extends LoopTyme {
  static const List<String> names = ['子不问卜自惹祸殃', '丑不冠带主不还乡', '寅不祭祀神鬼不尝', '卯不穿井水泉不香', '辰不哭泣必主重丧', '巳不远行财物伏藏', '午不苫盖屋主更张', '未不服药毒气入肠', '申不安床鬼祟入房', '酉不会客醉坐颠狂', '戌不吃犬作怪上床', '亥不嫁娶不利新郎'];

  PengZuEarthBranch(int index) : super(names, index);

  PengZuEarthBranch.fromIndex(int index) : this(index);

  PengZuEarthBranch.fromName(String name) : super.fromName(names, name);

  @override
  PengZuEarthBranch next(int n) => PengZuEarthBranch(nextIndex(n));
}
