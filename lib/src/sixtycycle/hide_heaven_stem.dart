import '../abstract_culture.dart';
import '../enums/hide_heaven_stem_type.dart';
import 'heaven_stem.dart';

/// 藏干（即人元，司令取天干，分野取天干的五行）
///
/// Author: 6tail
class HideHeavenStem extends AbstractCulture {
  /// 天干
  final HeavenStem heavenStem;

  /// 藏干类型
  final HideHeavenStemType type;

  HideHeavenStem(this.heavenStem, this.type);

  HideHeavenStem.fromName(String heavenStemName, this.type) : heavenStem = HeavenStem.fromName(heavenStemName);

  HideHeavenStem.fromIndex(int heavenStemIndex, this.type) : heavenStem = HeavenStem(heavenStemIndex);

  /// 天干
  HeavenStem getHeavenStem() => heavenStem;

  /// 藏干类型
  HideHeavenStemType getType() => type;

  @override
  String getName() => heavenStem.getName();
}
