function resized = resizeImg()
  for i=0:9
    for j=9:12
      name = strcat("../data/Slike Andraž/Color/", int2str(i), "_", int2str(j), ".jpg");
      a = imresize(rgb2gray(imread(name)), [16,16], 'bilinear');
      endname = strcat("../data/Slike Andraž/Gray/Bilinear/", int2str(i), "_", int2str(j), "_res.png");
      imwrite(a, endname);
    end
  end
  
end