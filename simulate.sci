getd('./functions');
xdel(winsid());

exec setCases.sci;

state = round(rand(1000, 1000) - .3);
shift = 0;

while 1
  newState = Evolve(state, shift, .01);
  if newState == state
    break;
  end
  state = newState;
  shift = 1 - shift;
  Draw(state);
  sleep(10);
end