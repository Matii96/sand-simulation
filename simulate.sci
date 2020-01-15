clc;
getd('/Users/mat/Projekty/sand-simulation/functions');

shift = 0;

state = [0 30 30 0; 0 0 0 0; 0 0 0 0; 0 0 0 0];
newState = state;
while 1
  newState = Evolve(state, shift);
  if newState == state
    break;
  end
  state = newState;
  shift = 1 - shift;
  Draw(state);
  sleep(500);
end