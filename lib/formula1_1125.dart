import 'dart:io';

///Link of exercise: https://www.beecrowd.com.br/judge/pt/problems/view/1125

/// Simple entry:
/// 1 3
/// 3 2 1
/// 2
/// 3 5 3 2
/// 3 5 3 1
///
/// Result
/// 3
/// 3

void main(List<String> arguments) {
  int g;
  int p;
  bool stop;
  do {
    var line1 = stdin.readLineSync();
    var line1Split = line1!.split(" ");

    g = int.parse(line1Split.first);
    p = int.parse(line1Split.last);

    stop = !needStop(g, p);
    if (stop) {
      executeCheck(g, p);
    }
  } while (stop);
}

bool needStop(int g, int p) {
  if (g == 0 || p == 0) {
    return true;
  }
  return false;
}

void executeCheck(int g, int p) {
  var grandPrixMap = getMapFromConsole(g);

  var s = int.parse(stdin.readLineSync().toString());

  var systemsMap = getMapFromConsole(s);

  for (int systemIndex in systemsMap.keys) {
    var system = systemsMap[systemIndex]!;
    var limit = system.first;

    var results = List.generate(p, (index) => 0);

    for (int gpIndex in grandPrixMap.keys) {
      var gp = grandPrixMap[gpIndex]!;

      for (int indexP = 0; indexP < p; indexP++) {
        var position = gp[indexP];
        if (position <= limit) {
          results[indexP] += system[position];
        }
      }
    }

    print(getIndexHigherValue(results));
  }
}

String getIndexHigherValue(List<int> intList) {
  String result = "";
  var greaterValue = 0;
  var index = <int>[];
  for (var i = 0; i < intList.length; i++) {
    if (intList[i] > greaterValue) {
      greaterValue = intList[i];
      index = <int>[];
      index.add(i + 1);
    } else if (intList[i] == greaterValue) {
      index.add(i + 1);
    }
  }

  for (var item in index) {
    if (result == "") {
      result += item.toString();
    } else {
      result += " ${item.toString()}";
    }
  }
  return result;
}

Map<int, List<int>> getMapFromConsole(int numberLines) {
  var map = <int, List<int>>{};

  for (var index = 0; index < numberLines; index++) {
    var line = stdin.readLineSync();
    var lineSplit = line!.split(" ");

    var lineList = <int>[];

    for (var position in lineSplit) {
      lineList.add(int.parse(position));
    }

    map[index] = lineList;
  }

  return map;
}

void printMap(Map mapToPrint) {
  for (int item in mapToPrint.keys) {
    var result = mapToPrint[item]!;
    print(result);
  }
}
