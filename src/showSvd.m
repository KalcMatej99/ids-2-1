function showSvd(digit = 0, k = 8)
  data = load(strcat('./../data/svdMatricesBilinear/' ,mat2str(digit), '.mat'));
  Ui = data.structToSave.u;
  Si = data.structToSave.s;
  vec = zeros(256, 1);
  for j=1:k
    vec = vec + Ui(:, j)*Si(j, j);
    vec = uint8(vec);
  endfor
  
  vec = reshape(vec, [16,16])';
  imshow(uint8(vec));
  