String solution(String inputString) {
  var result = <String>[];
  var stackList = <List<String>>[];

  var asList = inputString.split("");

  for (var char in asList) {
    if (char == "(") {
      stackList.add([]);
      continue;
    }

    if (char == ")") {
      var stack = (stackList.removeLast()).reversed;
      stackList.isEmpty ? result.addAll(stack) : stackList.last.addAll(stack);
      continue;
    }

    if (stackList.isNotEmpty) {
      stackList.last.add(char);
    } else {
      result.add(char);
    }
  }

  return result.isNotEmpty ? result.join("") : "";
}

void main(List<String> args) {
  // var strTest = "(bar)";
  var strTest = "as((dgd((sdf)asu)kmnc)dhj)btbt(()(s)d(sd(ssf)sd))";
  print(solution(strTest));
}


// Write a function that reverses characters in (possibly nested) parentheses in the input string.

// Input strings will always be well-formed with matching ()s.


//Example

// For inputString = "(bar)", the output should be
// solution(inputString) = "rab";

// For inputString = "foo(bar)baz", the output should be
// solution(inputString) = "foorabbaz";

// For inputString = "foo(bar)baz(blim)", the output should be
// solution(inputString) = "foorabbazmilb";

// For inputString = "foo(bar(baz))blim", the output should be
// solution(inputString) = "foobazrabblim".
// Because "foo(bar(baz))blim" becomes "foo(barzab)blim" and then "foobazrabblim".