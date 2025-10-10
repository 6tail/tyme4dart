import '../loop_tyme.dart';
import '../culture/direction.dart';

/// 藏历五行（铁替换金）
///
/// Author: 6tail
class RabByungElement extends LoopTyme {
  static const List<String> _names = ['木', '火', '土', '铁', '水'];

  RabByungElement._(int index) : super.fromIndex(_names, index);

  RabByungElement._fromName(String name) : super.fromName(_names, _convertName(name));

  static String _convertName(String name) {
    // 藏历中金替换为铁
    return name == '金' ? '铁' : name;
  }

  static RabByungElement fromIndex(int index) {
    return RabByungElement._(index);
  }

  static RabByungElement fromName(String name) {
    return RabByungElement._fromName(name);
  }

  @override
  RabByungElement next(int n) {
    return fromIndex(nextIndex(n));
  }

  /// 我生者
  RabByungElement getReinforce() {
    return next(1);
  }

  /// 我克者
  RabByungElement getRestrain() {
    return next(2);
  }

  /// 生我者
  RabByungElement getReinforced() {
    return next(-1);
  }

  /// 克我者
  RabByungElement getRestrained() {
    return next(-2);
  }

  /// 方位
  Direction getDirection() {
    const List<int> directions = [2, 8, 4, 6, 0];
    return Direction.fromIndex(directions[index]);
  }
}
