import '../loop_tyme.dart';

/// 元（60年=1元，3元=1运）
///
/// Author: 6tail
class Sixty extends LoopTyme {
  static const List<String> names = ['上元', '中元', '下元'];

  Sixty(int index) : super(names, index);

  Sixty.fromIndex(int index) : this(index);

  Sixty.fromName(String name) : super.fromName(names, name);

  @override
  Sixty next(int n) => Sixty(nextIndex(n));
}
