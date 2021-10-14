function runBilinearTest(number_of_iterations = 1)
  transformRGBImagesToGrayImages("bilinear", true);
  transformBilinearResizedGrayImagesToBigMatrixCSV();
  
  results = [];
  for i = 1:number_of_iterations
    saveSVDofA("./../data/dataMatrixWithLabelsBilinear.csv", './../data/svdMatricesBilinear/', "./../data/testBilinear.csv");
    [CA_MP, CA_SVD] = digits('./../data/svdMatricesBilinear/', "./../data/testBilinear.csv");
    results = [results; [CA_MP, CA_SVD]];
  end
  CA_MP_mean = mean(results(:, 1));
  CA_MP_std = std(results(:, 1));
  CA_SVD_mean = mean(results(:, 2));
  CA_SVD_std = std(results(:, 2));
  disp(results);
  disp("With centering and normalization");
  disp(strcat("CA MP mean: ", num2str(CA_MP_mean), ", std: ", num2str(CA_MP_std)));
  disp(strcat("CA SVD mean: ", num2str(CA_SVD_mean), ", std: ", num2str(CA_SVD_std)));
  
  transformRGBImagesToGrayImages("bilinear", false);
  transformBilinearResizedGrayImagesToBigMatrixCSV();
  
  results = [];
  for i = 1:number_of_iterations
    saveSVDofA("./../data/dataMatrixWithLabelsBilinear.csv", './../data/svdMatricesBilinear/', "./../data/testBilinear.csv");
    [CA_MP, CA_SVD] = digits('./../data/svdMatricesBilinear/', "./../data/testBilinear.csv");
    results = [results; [CA_MP, CA_SVD]];
  end
  CA_MP_mean = mean(results(:, 1));
  CA_MP_std = std(results(:, 1));
  CA_SVD_mean = mean(results(:, 2));
  CA_SVD_std = std(results(:, 2));
  disp(results);
  disp("Without centering and normalization");
  disp(strcat("CA MP mean: ", num2str(CA_MP_mean), ", std: ", num2str(CA_MP_std)));
  disp(strcat("CA SVD mean: ", num2str(CA_SVD_mean), ", std: ", num2str(CA_SVD_std)));
  
  