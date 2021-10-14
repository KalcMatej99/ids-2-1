function saveSVDofA(pathToData = "./../data/dataMatrixWithLabelsNearest.csv", pathSVDFiles = './../data/svdMatricesNearest/', pathTestFile = './../data/testNearest.csv')
  data = dlmread(pathToData, ",");
  data = data(randperm(size(data,1)),:);
  number_of_rows = rows(data);
  A = {[], [],[],[],[],[],[],[],[],[]};
  numberOfImagesForEachDigit = [0,0,0,0,0,0,0,0,0,0];
  
  for i = 0:9
    numberOfImagesForEachDigit(i + 1) = sum(data(:, 1) == i);
  end
  
  numberOfImagesForEachDigitInTrainData = [0,0,0,0,0,0,0,0,0,0];
  testData = [];
  
  trainTestSplit = 0.85;
  
  for i = 1:number_of_rows
    real_digit = data(i, 1);
    if(numberOfImagesForEachDigitInTrainData(real_digit + 1) < floor(numberOfImagesForEachDigit(real_digit + 1)*trainTestSplit))
      numberOfImagesForEachDigitInTrainData(real_digit + 1) += 1;
      data_row = data(i, :);

      Ai = cell2mat(A(real_digit + 1));
      Ai = [Ai; data_row];
      A(real_digit + 1) = Ai;
    else
      testData = [testData; data(i, :)];
    endif
  end

  for i = 0:9
    Ai = cell2mat(A(i + 1));
    Ai = Ai(:, 2:end)';
    [Ui, Si, ~] = svd(Ai);
    structToSave.u = Ui;
    structToSave.s = Si;
    structToSave.a = Ai;
    save("-text", strcat(pathSVDFiles, num2str(i), '.mat'), "structToSave");
  end
  
  dlmwrite(pathTestFile, testData, ",");
  