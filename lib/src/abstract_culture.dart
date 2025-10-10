import 'culture.dart';

/// 传统文化抽象
///
/// Author: 6tail
abstract class AbstractCulture implements Culture {
  @override
  String toString() => getName();

  @override
  bool operator ==(Object other) => other is Culture && toString() == other.toString();

  @override
  int get hashCode => toString().hashCode;

  /// 将[index]索引转换为不超[size]范围的索引
  int indexOfSize(int index, int size) {
    int i = index % size;
    if (i < 0) {
      i += size;
    }
    return i;
  }
}
