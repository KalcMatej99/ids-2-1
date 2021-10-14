function transformBilinearResizedGrayImagesToBigMatrixCSV()
  dataMatrix = [];
  for(digit = 0:9)
    filenames = ls(strcat('./../data/Slike Matej/Gray/bilinear/', num2str(digit)));
    for i = 1:rows(filenames)
      path_of_image = strcat('./../data/Slike Matej/Gray/bilinear/', num2str(digit), "/", filenames(i, :));
      gray_image = dlmread(path_of_image);
      reshaped_gray_image = reshape(gray_image', [1, 256]);
      reshaped_gray_image_with_label = [digit, reshaped_gray_image];
      dataMatrix = [dataMatrix; reshaped_gray_image_with_label];
    end
  end
  %{
  for(digit = 0:9)
    filenames = ls(strcat('./../data/Slike Andraž/Gray/bilinear/', num2str(digit)));
    for i = 1:rows(filenames)
      path_of_image = strcat('./../data/Slike Andraž/Gray/bilinear/', num2str(digit), "/", filenames(i, :));
      gray_image = dlmread(path_of_image);
      reshaped_gray_image = reshape(gray_image, [1, 256]);
      reshaped_gray_image_with_label = [digit, reshaped_gray_image];
      dataMatrix = [dataMatrix; reshaped_gray_image_with_label];
    end
  end
  
  for(digit = 0:9)
    filenames = ls(strcat('./../data/Slike Samo/Gray/bilinear/', num2str(digit)));
    for i = 1:rows(filenames)
      path_of_image = strcat('./../data/Slike Samo/Gray/bilinear/', num2str(digit), "/", filenames(i, :));
      gray_image = dlmread(path_of_image);
      reshaped_gray_image = reshape(gray_image, [1, 256]);
      reshaped_gray_image_with_label = [digit, reshaped_gray_image];
      dataMatrix = [dataMatrix; reshaped_gray_image_with_label];
    end
  end%}
  
  dlmwrite('./../data/dataMatrixWithLabelsBilinear.csv', dataMatrix, ",");