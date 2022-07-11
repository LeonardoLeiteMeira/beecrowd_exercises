import 'package:beecrowd/formula1_1125.dart';
import 'package:test/test.dart';

void main() {
  group("Test getIndexHigherValue", () {
    test("In order list", () {
      var list = [1, 2, 3, 4, 5];
      var result = getIndexHigherValue(list);

      expect(result, "5");
    });

    test("unordered list", () {
      var list = [3, 2, 5, 4, 1];
      var result = getIndexHigherValue(list);

      expect(result, "3");
    });

    test("Draw 1", () {
      var list = [5, 2, 5, 4, 1];
      var result = getIndexHigherValue(list);

      expect(result, "1 3");
    });
    test("Draw 2", () {
      var list = [3, 2, 3, 5, 5];
      var result = getIndexHigherValue(list);

      expect(result, "4 5");
    });
  });

  group("Need Stop Test", () {
    test("0 0", () {
      var g = 0;
      var p = 0;
      var result = needStop(g, p);
      expect(result, true);
    });

    test("0 1", () {
      var g = 0;
      var p = 1;
      var result = needStop(g, p);
      expect(result, true);
    });

    test("1 0", () {
      var g = 1;
      var p = 0;
      var result = needStop(g, p);
      expect(result, true);
    });

    test("1 1", () {
      var g = 1;
      var p = 1;
      var result = needStop(g, p);
      expect(result, false);
    });
  });
}
