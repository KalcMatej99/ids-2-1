function normalized_img = normalize_gray_image(img)
  img = double(img);
  img = img + 1;
  maxValue = max(max(img));
  normalized_img = img * (256/maxValue);
  
  normalized_img = (256 - normalized_img);
  maxValue = max(max(normalized_img));
  normalized_img = 256 - (normalized_img .* (255/maxValue));
  
  normalized_img = normalized_img - 1;
  normalized_img = round(normalized_img);
  normalized_img(normalized_img > 255) = 255;
  normalized_img(normalized_img < 0) = 0;
  normalized_img = uint8(normalized_img);
  
  
end

%!test
%! path_of_image = strcat('./../data/Slike Matej/Color/0/IMG_1972.jpg');
%! gray_image = rgb2gray(imread(path_of_image));
%! disp(min(min(gray_image)));
%! disp(max(max(gray_image)));
%! norm_gray_image = normalize_gray_image(gray_image);
%! assert(min(min(norm_gray_image)), uint8(0));
%! assert(max(max(norm_gray_image)), uint8(255));
%! disp(sum(sum(abs(gray_image - norm_gray_image))));
%! imshow(norm_gray_image);