getd('./functions');
xdel(winsid());

exec setCases.sci;

//state = round(rand(7, 7) - .3);
state = StartingPosition();

shift = 0;
noChange = 0;
while 1
  newState = Evolve(state, shift, .01);
  if newState == state
    noChange = noChange + 1;
    if noChange == 3
      break;
    end
  else
    noChange = 0;
  end
  state = newState;
  shift = 1 - shift;
  Draw(state);
  sleep(150);
end