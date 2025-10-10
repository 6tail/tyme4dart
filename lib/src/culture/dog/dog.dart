import '../../loop_tyme.dart';

/// 三伏
///
/// Author: 6tail
class Dog extends LoopTyme {
  static const List<String> names = ['初伏', '中伏', '末伏'];

  Dog(int index) : super(names, index);

  Dog.fromIndex(int index) : this(index);

  Dog.fromName(String name) : super.fromName(names, name);

  @override
  Dog next(int n) => Dog(nextIndex(n));
}
