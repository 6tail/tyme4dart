import '../culture/pengzu/pengzu.dart';
import '../culture/sound.dart';
import '../culture/ten.dart';
import '../loop_tyme.dart';
import 'earth_branch.dart';
import 'heaven_stem.dart';

/// 六十甲子(六十干支周)
///
/// Author: 6tail
class SixtyCycle extends LoopTyme {
  /// 六十甲子名称
  static const List<String> names = ['甲子', '乙丑', '丙寅', '丁卯', '戊辰', '己巳', '庚午', '辛未', '壬申', '癸酉', '甲戌', '乙亥', '丙子', '丁丑', '戊寅', '己卯', '庚辰', '辛巳', '壬午', '癸未', '甲申', '乙酉', '丙戌', '丁亥', '戊子', '己丑', '庚寅', '辛卯', '壬辰', '癸巳', '甲午', '乙未', '丙申', '丁酉', '戊戌', '己亥', '庚子', '辛丑', '壬寅', '癸卯', '甲辰', '乙巳', '丙午', '丁未', '戊申', '己酉', '庚戌', '辛亥', '壬子', '癸丑', '甲寅', '乙卯', '丙辰', '丁巳', '戊午', '己未', '庚申', '辛酉', '壬戌', '癸亥'];

  SixtyCycle(int index) : super(names, index);

  SixtyCycle.fromIndex(int index) : this(index);

  SixtyCycle.fromName(String name) : super.fromName(names, name);

  /// 天干
  HeavenStem getHeavenStem() => HeavenStem(index % HeavenStem.names.length);

  /// 地支
  EarthBranch getEarthBranch() => EarthBranch(index % EarthBranch.names.length);

  /// 纳音
  Sound getSound() => Sound(index ~/ 2);

  /// 彭祖百忌
  PengZu getPengZu() => PengZu.fromSixtyCycle(this);

  /// 旬
  Ten getTen() => Ten((getHeavenStem().index - getEarthBranch().index) ~/ 2);

  /// 旬空(空亡)，因地支比天干多2个，旬空则为每一轮干支一一配对后多出来的2个地支
  List<EarthBranch> getExtraEarthBranches() {
    List<EarthBranch> list = [];
    EarthBranch first = EarthBranch.fromIndex(10 + getEarthBranch().index - getHeavenStem().index);
    list.add(first);
    list.add(first.next(1));
    return list;
  }

  @override
  SixtyCycle next(int n) => SixtyCycle(nextIndex(n));
}
