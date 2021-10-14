function error = digitErrorSVD(Ui, Si, b)
  error = norm(Ui' * b - Si * (pinv(Ui * Si) * b));
    