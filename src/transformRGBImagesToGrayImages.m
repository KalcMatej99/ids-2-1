function transformRGBImagesToGrayImages(resizeMethod = 'bilinear', useCenteringAndNormalization = true)
  for digit = 0:9
    filenames = ls(strcat('./../data/Slike Matej/Color/', num2str(digit)));
    number_of_images = rows(filenames);
    for i = 1:number_of_images
      path_of_image = strcat('./../data/Slike Matej/Color/', num2str(digit), "/", filenames(i, :));
      if isrgb(imread(path_of_image))
        gray_image = rgb2gray(imread(path_of_image));
      else
        gray_image = imread(path_of_image);
      endif
      if(useCenteringAndNormalization)
        gray_image = normalize_gray_image(gray_image);
        gray_image = center_gray_image(gray_image);
      endif
      resized_gray_image = round(imresize(gray_image, [16,16], resizeMethod));
      dlmwrite(strcat('./../data/Slike Matej/Gray/', resizeMethod, '/', num2str(digit), '/', num2str(i), '.csv'), resized_gray_image, ",");
    endfor
  endfor
  %{
  for digit = 0:9
    filenames = ls(strcat('./../data/Slike Andraž/Color/', num2str(digit)));
    number_of_images = rows(filenames);
    for i = 1:number_of_images
      path_of_image = strcat('./../data/Slike Andraž/Color/', num2str(digit), "/", filenames(i, :));
      if isrgb(imread(path_of_image))
        gray_image = rgb2gray(imread(path_of_image));
      else
        gray_image = imread(path_of_image);
      endif
      if(useCenteringAndNormalization)
        gray_image = normalize_gray_image(gray_image);
        gray_image = center_gray_image(gray_image);
      endif
      resized_gray_image = round(imresize(gray_image, [16,16], resizeMethod));
      dlmwrite(strcat('./../data/Slike Andraž/Gray/', resizeMethod, '/', num2str(digit), '/', num2str(i), '.csv'), resized_gray_image, ",");
    endfor
  endfor
  
   for digit = 0:9
    filenames = ls(strcat('./../data/Slike Samo/Color/', num2str(digit)));
    number_of_images = rows(filenames);
    for i = 1:number_of_images
      path_of_image = strcat('./../data/Slike Samo/Color/', num2str(digit), "/", filenames(i, :));
      if isrgb(imread(path_of_image))
        gray_image = rgb2gray(imread(path_of_image));
      else
        gray_image = imread(path_of_image);
      endif
      if(useCenteringAndNormalization)
        gray_image = normalize_gray_image(gray_image);
        gray_image = center_gray_image(gray_image);
      endif
      resized_gray_image = round(imresize(gray_image, [16,16], resizeMethod));
      dlmwrite(strcat('./../data/Slike Samo/Gray/', resizeMethod, '/', num2str(digit), '/', num2str(i), '.csv'), resized_gray_image, ",");
    endfor
  endfor%}