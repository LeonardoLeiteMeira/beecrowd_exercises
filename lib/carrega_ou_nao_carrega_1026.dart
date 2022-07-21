import 'dart:io';

///Link of exercise: https://www.beecrowd.com.br/judge/pt/problems/view/1026
///
///Simple entry
///4 6
///6 9
///
///Result
///2
///15
///

/// Code in C because I cant read EOF in Dart
// #include <stdio.h>

// int main(){
//     long long int number1, number2;
//     while(scanf("%lld %lld", &number1, &number2) != EOF){
//         printf("%lld\n", number1 ^ number2);
//     }
//     return 0;
// }

void main(List<String> arguments) {
  var line = stdin.readLineSync();
  while (line != null && line != "") {
    var numbersInLine = line.split(" ");
    var firstNumber = int.parse(numbersInLine[0]);
    var secondNumber = int.parse(numbersInLine[1]);

    print(firstNumber ^ secondNumber);

    line = stdin.readLineSync();
  }
}
