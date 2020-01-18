function [state] = StartingPosition()
  state = zeros(50, 40);
  s = size(state);
  for x = 1:s(1)
    for y = 1:s(2)
      if y < SandLine(x)
        state((s(1) - x + 1), y) = 1;
      end
    end
  end
endfunction
