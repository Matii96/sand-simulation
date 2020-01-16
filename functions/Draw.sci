function Draw(matrix)
  // Yellow sand
  matrix = matrix .* 37;

  // White background
  matrix = matrix - 5;

  Matplot(matrix);
endfunction