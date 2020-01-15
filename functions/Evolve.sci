function [state] = Evolve(state, shift)
  cellSize = 2;
  s = size(state);

  // Enlarge state by cellSize in each direction to prevent exceeding array in edge cases
  originalState = [cellSize:cellSize + s(1) - 1, cellSize:cellSize + s(2) - 1];
  enlargedState = ones(s(1) + (cellSize - 1) * 2, s(2) + (cellSize - 1) * 2);
  enlargedState = enlargedState .* 2;
  enlargedState(originalState(1), originalState(2)) = state;
  s = size(enlargedState);

  shift = cellSize - shift;

  rowIdx = shift + 1;
  while rowIdx <= s(1) - shift
    colIdx = shift + 1;
    cellRows = rowIdx:rowIdx + cellSize - 1;
    while colIdx <= s(2) - shift
      cellCols = colIdx:colIdx + cellSize - 1;
      enlargedState(cellRows, cellCols) = EvolveCell(enlargedState(cellRows, cellCols));
      colIdx = colIdx + cellSize;
    end
    rowIdx = rowIdx + cellSize;
  end

  state = enlargedState(originalState(1), originalState(2));
endfunction
