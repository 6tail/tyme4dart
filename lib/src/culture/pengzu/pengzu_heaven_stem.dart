import '../../loop_tyme.dart';

/// 天干彭祖百忌
///
/// Author: 6tail
class PengZuHeavenStem extends LoopTyme {
  static const List<String> names = ['甲不开仓财物耗散', '乙不栽植千株不长', '丙不修灶必见灾殃', '丁不剃头头必生疮', '戊不受田田主不祥', '己不破券二比并亡', '庚不经络织机虚张', '辛不合酱主人不尝', '壬不泱水更难提防', '癸不词讼理弱敌强'];

  PengZuHeavenStem(int index) : super(names, index);

  PengZuHeavenStem.fromIndex(int index) : this(index);

  PengZuHeavenStem.fromName(String name) : super.fromName(names, name);

  @override
  PengZuHeavenStem next(int n) => PengZuHeavenStem(nextIndex(n));
}
