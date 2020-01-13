clf();
ax = gca();
ax.data_bounds = [0, 0; 100, 100];
ax.box = 'on';

a = 5*ones(11,11);
Matplot1(a, [0 0 5 10]);