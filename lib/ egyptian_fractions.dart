///Link of exercise: https://www.codewars.com/kata/54f8693ea58bce689100065f/train/dart

Map<String, int> fractionSubtraction(int nr1, int dr1, int nr2, int dr2) {
  var resultNr = nr1 * dr2 - nr2 * dr1;
  var resultDr = dr1 * dr2;

  return {"nr": resultNr, "dr": resultDr};
}

List<String> doDecomposition(int nrStr, int drStr) {
  if (nrStr == 0) {
    return [];
  }

  if (nrStr % drStr == 0 || drStr / nrStr == 1) {
    return ["${(nrStr / drStr).truncate()}"];
  }

  var resultDr = drStr ~/ nrStr + (drStr % nrStr == 0 ? 0 : 1);
  // var resultDr = (drStr / nrStr).ceil();

  var nextToDecompose = fractionSubtraction(nrStr, drStr, 1, resultDr);

  var decomposed =
      doDecomposition(nextToDecompose["nr"]!, nextToDecompose["dr"]!);

  if (decomposed.isEmpty) {
    var result = resultDr == 1 ? "$resultDr" : "1/$resultDr";
    return [result];
  }

  var firstItem = num.tryParse(decomposed[0]);
  if (firstItem != null &&
      resultDr == 1 &&
      firstItem == firstItem.truncateToDouble()) {
    decomposed[0] = (firstItem + resultDr).toString();
    return decomposed;
  }

  var result = resultDr == 1 ? "$resultDr" : "1/$resultDr";
  return decomposed == [""] ? [result] : [result, ...decomposed];
}

String decompose(String nrStr, drStr) {
  var result = doDecomposition(int.parse(nrStr), int.parse(drStr));
  return "$result";
}

void main(List<String> args) {
  print(decompose("29", "5"));
}
