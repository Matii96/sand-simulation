getd('./functions');
xdel(winsid());

exec setCases.sci;

// Prepare arrays for multiple asynchronous simulations
state = StartingPosition();
blockadeChances = [.4 .35 .3 .25 .2 .15 .1 .05 .02];
states = [];
iterations = zeros(1, length(blockadeChances));
noChange = zeros(1, length(blockadeChances));
for i = 1:length(blockadeChances)
  states(:,:,i) = state;
end

// Prepare subplot size
rows = floor(sqrt(length(blockadeChances)));
cols = ceil(length(blockadeChances) / rows);

shift = 0;
while 1
  for simulationIdx = 1:length(blockadeChances)
    if noChange(simulationIdx) >= 3
      continue;
    end
    newState = Evolve(states(:,:,simulationIdx), shift, blockadeChances(simulationIdx));
    iterations(simulationIdx) = iterations(simulationIdx) + 1;
    if isequal(newState, states(:,:,simulationIdx))
      ended(simulationIdx) = 1;
      noChange(simulationIdx) = noChange(simulationIdx) + 1;
      continue;
    end
    states(:,:,simulationIdx) = newState;
  end
  shift = 1 - shift;

  // Draw all results at the same time
  for simulationIdx = 1:length(blockadeChances)
    subplot(rows, cols, simulationIdx);
    Draw(states(:,:,simulationIdx));
  end

  // Check for script end
  if min(noChange) == 3
    break;
  end

  //sleep(10);
end

for simulationIdx = 1:length(iterations)
  sprintf('%d iterations for %.3f blockade chance', iterations(simulationIdx), blockadeChances(simulationIdx))
end