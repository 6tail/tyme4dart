import 'package:test/test.dart';
import 'package:tyme/tyme.dart';

/// 神煞测试
///
/// Author: 6tail
void main() {
  group('God Tests', () {
    test('test0 - 2004年2月16日神煞', () {
      var gods = SolarDay.fromYmd(2004, 2, 16).getSixtyCycleDay().getGods();
      var ji = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '吉') {
          ji.add(god.getName());
        }
      }

      var xiong = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '凶') {
          xiong.add(god.getName());
        }
      }
      expect(ji, ['天恩', '续世', '明堂']);
      expect(xiong, ['月煞', '月虚', '血支', '天贼', '五虚', '土符', '归忌', '血忌']);
    });

    test('test1 - 2029年11月16日神煞', () {
      var gods = SolarDay.fromYmd(2029, 11, 16).getSixtyCycleDay().getGods();
      var ji = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '吉') {
          ji.add(god.getName());
        }
      }

      var xiong = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '凶') {
          xiong.add(god.getName());
        }
      }
      expect(ji, ['天德合', '月空', '天恩', '益后', '金匮']);
      expect(xiong, ['月煞', '月虚', '血支', '五虚']);
    });

    test('test2 - 1954年7月16日神煞', () {
      var gods = SolarDay.fromYmd(1954, 7, 16).getSixtyCycleDay().getGods();

      // 吉神宜趋
      var ji = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '吉') {
          ji.add(god.getName());
        }
      }

      // 凶神宜忌
      var xiong = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '凶') {
          xiong.add(god.getName());
        }
      }

      expect(ji, ['民日', '天巫', '福德', '天仓', '不将', '续世', '除神', '鸣吠']);
      expect(xiong, ['劫煞', '天贼', '五虚', '五离']);
    });

    test('test3 - 2024年12月27日神煞', () {
      var gods = SolarDay.fromYmd(2024, 12, 27).getSixtyCycleDay().getGods();
      var ji = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '吉') {
          ji.add(god.getName());
        }
      }

      var xiong = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '凶') {
          xiong.add(god.getName());
        }
      }
      expect(ji, ['天恩', '四相', '阴德', '守日', '吉期', '六合', '普护', '宝光']);
      expect(xiong, ['三丧', '鬼哭']);
    });

    test('test4 - 2024年9月27日神煞', () {
      var gods = SolarDay.fromYmd(2024, 9, 27).getSixtyCycleDay().getGods();
      var ji = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '吉') {
          ji.add(god.getName());
        }
      }

      var xiong = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '凶') {
          xiong.add(god.getName());
        }
      }
      expect(ji, ['月空', '不将', '福生', '金匮', '鸣吠']);
      expect(xiong, ['天罡', '大时', '大败', '咸池', '天贼', '九坎', '九焦']);
    });

    test('test5 - 2004年2月16日神煞（农历）', () {
      var gods = SolarDay.fromYmd(2004, 2, 16).getLunarDay().getGods();
      var ji = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '吉') {
          ji.add(god.getName());
        }
      }

      var xiong = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '凶') {
          xiong.add(god.getName());
        }
      }
      expect(ji, ['天恩', '续世', '明堂']);
      expect(xiong, ['月煞', '月虚', '血支', '天贼', '五虚', '土符', '归忌', '血忌']);
    });

    test('test6 - 2029年11月16日神煞（农历）', () {
      var gods = SolarDay.fromYmd(2029, 11, 16).getLunarDay().getGods();
      var ji = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '吉') {
          ji.add(god.getName());
        }
      }

      var xiong = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '凶') {
          xiong.add(god.getName());
        }
      }
      expect(ji, ['天德合', '月空', '天恩', '益后', '金匮']);
      expect(xiong, ['月煞', '月虚', '血支', '五虚']);
    });

    test('test7 - 1954年7月16日神煞（农历）', () {
      var gods = SolarDay.fromYmd(1954, 7, 16).getLunarDay().getGods();

      // 吉神宜趋
      var ji = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '吉') {
          ji.add(god.getName());
        }
      }

      // 凶神宜忌
      var xiong = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '凶') {
          xiong.add(god.getName());
        }
      }

      expect(ji, ['民日', '天巫', '福德', '天仓', '不将', '续世', '除神', '鸣吠']);
      expect(xiong, ['劫煞', '天贼', '五虚', '五离']);
    });

    test('test8 - 2024年12月27日神煞（农历）', () {
      var gods = SolarDay.fromYmd(2024, 12, 27).getLunarDay().getGods();
      var ji = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '吉') {
          ji.add(god.getName());
        }
      }

      var xiong = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '凶') {
          xiong.add(god.getName());
        }
      }
      expect(ji, ['天恩', '四相', '阴德', '守日', '吉期', '六合', '普护', '宝光']);
      expect(xiong, ['三丧', '鬼哭']);
    });

    test('test9 - 2024年9月27日神煞（农历）', () {
      var gods = SolarDay.fromYmd(2024, 9, 27).getLunarDay().getGods();
      var ji = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '吉') {
          ji.add(god.getName());
        }
      }

      var xiong = <String>[];
      for (var god in gods) {
        if (god.getLuck().getName() == '凶') {
          xiong.add(god.getName());
        }
      }
      expect(ji, ['月空', '不将', '福生', '金匮', '鸣吠']);
      expect(xiong, ['天罡', '大时', '大败', '咸池', '天贼', '九坎', '九焦']);
    });
  });
}
