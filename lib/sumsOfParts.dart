//https://www.codewars.com/kata/5ce399e0047a45001c853c2b

List<int> partsSums(List<int> ls) {
  var sum = 0;
  var result = <int>[];
  for (var i = ls.length; i >= 0; i--) {
    result.add(sum);
    if (i - 1 >= 0) {
      sum += ls[i - 1];
    }
  }
  return result.reversed.toList();
}

void main(List<String> args) {
  print(partsSums([0, 1, 3, 6, 10]));
}
