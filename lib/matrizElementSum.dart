class GoostRoom {
  int i;
  int j;
  GoostRoom({required this.i, required this.j});
}

bool canBeUsed(List<GoostRoom> goosts, int iTest, int jTest) {
  for (var goost in goosts) {
    if (goost.i < iTest && goost.j == jTest) {
      return false;
    }
  }
  return true;
}

int solution(List<List<int>> matrix) {
  var goosts = <GoostRoom>[];
  var sum = 0;
  for (var i = 0; i < matrix.length; i++) {
    for (var j = 0; j < matrix[i].length; j++) {
      if (matrix[i][j] == 0) {
        goosts.add(GoostRoom(i: i, j: j));
      } else if (canBeUsed(goosts, i, j)) {
        sum += matrix[i][j];
      }
    }
  }
  return sum;
}

void main(List<String> args) {
  var test = [
    [4, 0, 1],
    [10, 7, 0],
    [0, 0, 0],
    [9, 1, 2]
  ];
  print(solution(test));
}
///After becoming famous, the CodeBots decided to move into a new building together. Each of the rooms has a different cost, and some of them are free, but there's a rumour that all the free rooms are haunted! Since the CodeBots are quite superstitious, they refuse to stay in any of the free rooms, or any of the rooms below any of the free rooms.

///Given matrix, a rectangular matrix of integers, where each value represents the cost of the room, your task is to return the total sum of all rooms that are suitable for the CodeBots (ie: add up all the values that don't appear below a 0).
///matrix = [[0, 1, 1, 2], 
///        [0, 5, 0, 0], 
///        [2, 0, 3, 3]]
///the output should be
///solution(matrix) = 9.
///
///
///For
// matrix = [[1, 1, 1, 0], 
//           [0, 5, 0, 1], 
//           [2, 1, 3, 10]]
// the output should be
// solution(matrix) = 9