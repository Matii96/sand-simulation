function [state] = Evolve(state, shift, blockadeChance)
  global cases;
  cellSize = size(cases)(1);
  s = size(state);

  // Enlarge state by cellSize in each direction to prevent exceeding array in edge cases
  originalStateRows = cellSize:cellSize + s(1) - 1;
  originalStateCols = cellSize:cellSize + s(2) - 1;
  enlargedState = ones(s(1) + (cellSize - 1) * 2, s(2) + (cellSize - 1) * 2);
  enlargedState = enlargedState .* 2;
  enlargedState(originalStateRows, originalStateCols) = state;

  shift = cellSize - shift;
  rowIdx = shift;
  while rowIdx <= s(1) + cellSize - 1
    cellRows = rowIdx:rowIdx + cellSize - 1;

    colIdx = shift;
    while colIdx <= s(2) + cellSize - 1
      cellCols = colIdx:colIdx + cellSize - 1;

      enlargedState(cellRows, cellCols) = EvolveCell(enlargedState(cellRows, cellCols), blockadeChance);
      colIdx = colIdx + cellSize;
    end
    rowIdx = rowIdx + cellSize;
  end

  state = enlargedState(originalStateRows, originalStateCols);
endfunction
