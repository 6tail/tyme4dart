import '../../abstract_culture.dart';
import '../../sixtycycle/sixty_cycle.dart';
import 'pengzu_earth_branch.dart';
import 'pengzu_heaven_stem.dart';

/// 彭祖百忌
///
/// Author: 6tail
class PengZu extends AbstractCulture {
  /// 天干彭祖百忌
  late final PengZuHeavenStem pengZuHeavenStem;

  /// 地支彭祖百忌
  late final PengZuEarthBranch pengZuEarthBranch;

  PengZu(SixtyCycle sixtyCycle) {
    pengZuHeavenStem = PengZuHeavenStem(sixtyCycle.getHeavenStem().index);
    pengZuEarthBranch = PengZuEarthBranch(sixtyCycle.getEarthBranch().index);
  }

  PengZu.fromSixtyCycle(SixtyCycle sixtyCycle) : this(sixtyCycle);

  @override
  String getName() => '${pengZuHeavenStem.getName()} ${pengZuEarthBranch.getName()}';

  /// 天干彭祖百忌
  PengZuHeavenStem getPengZuHeavenStem() => pengZuHeavenStem;

  /// 地支彭祖百忌
  PengZuEarthBranch getPengZuEarthBranch() => pengZuEarthBranch;
}
