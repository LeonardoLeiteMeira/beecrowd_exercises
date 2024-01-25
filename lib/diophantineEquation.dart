import 'dart:math';

List<List<int>> solEqua(n) {
  var result = <List<int>>[];
  // (x - 2*y) * (x + 2*y) = n
  // a         *  b       = n
  // b = n/a
  var nSqrt = sqrt(n).toInt();
  for (var a = 1; a <= nSqrt; a++) {
    var b = n / a;
    if (b == b.toInt()) {
      // x = (a+b)/2
      // y = (b-a)/4
      b = b.toInt();
      var x = (a + b) / 2;
      var y = (b - a) / 4;
      if (x == x.toInt() && y == y.toInt() && x >= 0 && y >= 0) {
        result.add([x.toInt(), y.toInt()]);
      }
    }
  }
  return result;
}

void main(List<String> args) {
  print(solEqua(16));
}
