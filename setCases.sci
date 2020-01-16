global cases;
global substitutions;

cases = [];
cases(:,:,1) = [1 1; 0 0];  // BlockadeChance
cases(:,:,2) = [1 0; 0 0];
cases(:,:,3) = [0 1; 0 0];
cases(:,:,4) = [1 0; 1 0];
cases(:,:,5) = [0 1; 0 1];
cases(:,:,6) = [1 1; 1 0];
cases(:,:,7) = [1 1; 0 1];
cases(:,:,8) = [1 0; 0 1];
cases(:,:,9) = [0 1; 1 0];
cases(:,:,10) = [2 1; 2 0];
cases(:,:,11) = [1 2; 0 2];

substitutions = [];
substitutions(:,:,1) = [0 0; 1 1];  // BlockadeChance
substitutions(:,:,2) = [0 0; 1 0];
substitutions(:,:,3) = [0 0; 0 1];
substitutions(:,:,4) = [0 0; 1 1];
substitutions(:,:,5) = [0 0; 1 1];
substitutions(:,:,6) = [1 0; 1 1];
substitutions(:,:,7) = [0 1; 1 1];
substitutions(:,:,8) = [0 0; 1 1];
substitutions(:,:,9) = [0 0; 1 1];
substitutions(:,:,10) = [2 0; 2 1];
substitutions(:,:,11) = [0 2; 1 2];