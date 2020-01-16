function [cell] = EvolveCell(cell, blockadeChance)
  global cases;
  global substitutions;

  casesNum = size(cases)(3);
  for caseIdx = 1:casesNum
    if isequal(cell, cases(:,:,caseIdx))
      // Calculate two horizontal grains of sand blockade chance
      if caseIdx == 1 && rand() <= blockadeChance
        break;
      end

      cell = substitutions(:,:,caseIdx);
      break;
    end
  end
endfunction
