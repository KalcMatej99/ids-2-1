function CA = predictTestData(data, testData, useSVD = true, k = 1)
  number_of_images_in_test_data = rows(testData);

  number_of_correct_predictions = 0;
  
  
  for i = 1:number_of_images_in_test_data
    real_digit = testData(i, 1);
    test_image = testData(i, 2:end);
    predicted_digit = -1;
    min_error = 9999999;
    for(digit = 0:9)
      if(useSVD)
        Ui = data(digit + 1).structToSave.u;
        Si = zeros(size(data(digit + 1).structToSave.s));
        Si(:, 1:k) = data(digit + 1).structToSave.s(:, 1:k);
        error = digitErrorSVD(Ui, Si, test_image');
      else
        A = data(digit + 1).structToSave.a;
        error = digitErrorMP(A, test_image');
      endif

      if(error < min_error)
        min_error = error;
        predicted_digit = digit;
      endif
    endfor
    if(real_digit == predicted_digit)
      number_of_correct_predictions += 1;
    endif
    
  endfor
  CA = number_of_correct_predictions/number_of_images_in_test_data;
