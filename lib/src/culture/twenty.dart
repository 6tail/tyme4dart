import '../loop_tyme.dart';
import 'sixty.dart';

/// 运（20年=1运，3运=1元）
///
/// Author: 6tail
class Twenty extends LoopTyme {
  static const List<String> names = ['一运', '二运', '三运', '四运', '五运', '六运', '七运', '八运', '九运'];

  Twenty(int index) : super(names, index);

  Twenty.fromIndex(int index) : this(index);

  Twenty.fromName(String name) : super.fromName(names, name);

  @override
  Twenty next(int n) => Twenty(nextIndex(n));

  /// 元
  Sixty getSixty() => Sixty(index ~/ 3);
}
