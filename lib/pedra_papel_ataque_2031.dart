import 'dart:io';

///Link of exercise: https://www.beecrowd.com.br/judge/pt/problems/view/2031

/// Simple entry:
/// 2
/// pedra
/// pedra
/// ataque
/// papel
///
/// Result
/// Sem ganhador
/// Jogador 1 venceu

const String ataque = "ataque";
const String pedra = "pedra";
const String papel = "papel";

const String j1Win = "Jogador 1 venceu";
const String j2Win = "Jogador 2 venceu";
const String twoWin = "Ambos venceram";
const String draw = "Sem ganhador";
const String twoLose = "Aniquilacao mutua";

void main(List<String> arguments) {
  var numberOfPlays = int.parse(stdin.readLineSync() ?? "1");
  int plays = 0;

  do {
    plays++;
    var j1 = stdin.readLineSync() ?? "";
    var j2 = stdin.readLineSync() ?? "";
    print(getResult(j1, j2));
  } while (plays < numberOfPlays);
}

String getResult(String j1, String j2) {
  if (j1 == ataque && j2 == pedra) {
    return j1Win;
  }

  if (j1 == pedra && j2 == papel) {
    return j1Win;
  }

  if (j1 == papel && j2 == ataque) {
    return j2Win;
  }
//------
  if (j2 == ataque && j1 == pedra) {
    return j2Win;
  }

  if (j2 == pedra && j1 == papel) {
    return j2Win;
  }

  if (j2 == papel && j1 == ataque) {
    return j1Win;
  }
//------

  if (j1 == papel && j2 == papel) {
    return twoWin;
  }

  if (j1 == pedra && j2 == pedra) {
    return draw;
  }

  if (j1 == ataque && j2 == ataque) {
    return twoLose;
  }

  throw ("Error");
}
