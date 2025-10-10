import 'culture.dart';

/// Tyme
///
/// Author: 6tail
abstract class Tyme implements Culture {
  /// 推移[n]步
  Tyme? next(int n);
}
