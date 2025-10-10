import 'abstract_tyme.dart';

/// 可轮回的Tyme
///
/// Author: 6tail
abstract class LoopTyme extends AbstractTyme {
  /// 名称列表
  late final List<String> _names;

  /// 索引，从0开始
  late final int index;

  LoopTyme(this._names, int index) {
    this.index = indexOf(index);
  }

  LoopTyme.fromIndex(List<String> names, int index): this(names, index);

  LoopTyme.fromName(List<String> names, String name): _names = names {
    index = indexOfName(name);
  }

  /// 名称
  @override
  String getName() => _names[index];

  /// 索引
  int getIndex() => index;

  /// 数量
  int getSize() => _names.length;

  /// [name]名称对应的索引
  int indexOfName(String name) {
    for (int i = 0; i < _names.length; i++) {
      if (_names[i] == name) {
        return i;
      }
    }
    throw ArgumentError('illegal name: $name');
  }

  /// 将[index]索引转换为不超范围的索引
  int indexOf(int index) => indexOfSize(index, getSize());

  /// 推移[n]步后的索引
  int nextIndex(int n) => indexOf(index + n);

  /// 到[targetIndex]目标索引的步数
  int stepsTo(int targetIndex) => indexOf(targetIndex - index);
}
