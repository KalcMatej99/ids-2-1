function error = digitErrorMP(Ai, b)
  error = norm(b - Ai * (pinv(Ai) * b));