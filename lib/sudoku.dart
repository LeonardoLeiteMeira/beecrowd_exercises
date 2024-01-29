// Sudoku is a number-placement puzzle. The objective is to fill a 9 × 9 grid with numbers in such a way that each column, each row, and each of the nine 3 × 3 sub-grids that compose the grid all contain all of the numbers from 1 to 9 one time.

// Implement an algorithm that will check whether the given grid of numbers represents a valid Sudoku puzzle according to the layout rules described above. Note that the puzzle represented by grid does not have to be solvable.

//Exemples
// For

// grid = [['.', '.', '.', '1', '4', '.', '.', '2', '.'],
//         ['.', '.', '6', '.', '.', '.', '.', '.', '.'],
//         ['.', '.', '.', '.', '.', '.', '.', '.', '.'],
//         ['.', '.', '1', '.', '.', '.', '.', '.', '.'],
//         ['.', '6', '7', '.', '.', '.', '.', '.', '9'],
//         ['.', '.', '.', '.', '.', '.', '8', '1', '.'],
//         ['.', '3', '.', '.', '.', '.', '.', '.', '6'],
//         ['.', '.', '.', '.', '.', '7', '.', '.', '.'],
//         ['.', '.', '.', '5', '.', '.', '.', '7', '.']]
// the output should be
// solution(grid) = true;

// For
// grid = [['.', '.', '.', '.', '2', '.', '.', '9', '.'],
//         ['.', '.', '.', '.', '6', '.', '.', '.', '.'],
//         ['7', '1', '.', '.', '7', '5', '.', '.', '.'],
//         ['.', '7', '.', '.', '.', '.', '.', '.', '.'],
//         ['.', '.', '.', '.', '8', '3', '.', '.', '.'],
//         ['.', '.', '8', '.', '.', '7', '.', '6', '.'],
//         ['.', '.', '.', '.', '.', '2', '.', '.', '.'],
//         ['.', '1', '.', '2', '.', '.', '.', '.', '.'],
//         ['.', '2', '.', '.', '3', '.', '.', '.', '.']]
// the output should be
// solution(grid) = false.
// The given grid is not correct because there are two 1s in the second column. Each column, each row, and each 3 × 3 subgrid can only contain the numbers 1 through 9 one time.

// [execution time limit] 4 seconds (dart)
// [memory limit] 1 GB
// [input] array.array.char grid
// A 9 × 9 array of characters, in which each character is either a digit from '1' to '9' or a period '.'.
// [output] boolean
// Return true if grid represents a valid Sudoku puzzle, otherwise return false.

bool solution(List<List<String>> grid) {
  List<Set<String>> columns = List.generate(9, (_) => <String>{});
  List<Set<String>> rows = List.generate(9, (_) => <String>{});
  List<Set<String>> subGroups = List.generate(9, (_) => <String>{});

  for (var i = 0; i < grid.length; i++) {
    for (var j = 0; j < grid[i].length; j++) {
      var addRowSuccess = rows[i].add(grid[i][j]);
      var addColumnSuccess = columns[j].add(grid[i][j]);

      if (!addColumnSuccess || !addRowSuccess) {
        return false;
      }

      if (i >= 0 && i <= 2 && j >= 0 && j <= 2) {
        var success = subGroups[0].add(grid[i][j]);
        if (!success) {
          return false;
        }
      }
      if (i >= 0 && i <= 2 && j >= 3 && j <= 5) {
        var success = subGroups[1].add(grid[i][j]);
        if (!success) {
          return false;
        }
      }
      if (i >= 0 && i <= 2 && j >= 6 && j <= 8) {
        var success = subGroups[2].add(grid[i][j]);
        if (!success) {
          return false;
        }
      }

      if (i >= 3 && i <= 5 && j >= 0 && j <= 2) {
        var success = subGroups[3].add(grid[i][j]);
        if (!success) {
          return false;
        }
      }
      if (i >= 3 && i <= 5 && j >= 3 && j <= 5) {
        var success = subGroups[4].add(grid[i][j]);
        if (!success) {
          return false;
        }
      }
      if (i >= 3 && i <= 5 && j >= 6 && j <= 8) {
        var success = subGroups[5].add(grid[i][j]);
        if (!success) {
          return false;
        }
      }

      if (i >= 6 && i <= 8 && j >= 0 && j <= 2) {
        var success = subGroups[6].add(grid[i][j]);
        if (!success) {
          return false;
        }
      }
      if (i >= 6 && i <= 8 && j >= 3 && j <= 5) {
        var success = subGroups[7].add(grid[i][j]);
        if (!success) {
          return false;
        }
      }
      if (i >= 6 && i <= 8 && j >= 6 && j <= 8) {
        var success = subGroups[8].add(grid[i][j]);
        if (!success) {
          return false;
        }
      }
    }
  }
  return true;
}

void main(List<String> args) {
  var test = [
    [".", ".", ".", "1", "4", ".", ".", "2", "."],
    [".", ".", "6", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", ".", ".", ".", "."],
    [".", ".", "1", ".", ".", ".", ".", ".", "."],
    [".", "6", "7", ".", ".", ".", ".", ".", "9"],
    [".", ".", ".", ".", ".", ".", "8", "1", "."],
    [".", "3", ".", ".", ".", ".", ".", ".", "6"],
    [".", ".", ".", ".", ".", "7", ".", ".", "."],
    [".", ".", ".", "5", ".", ".", ".", "7", "."]
  ];
  print(solution(test));
}
