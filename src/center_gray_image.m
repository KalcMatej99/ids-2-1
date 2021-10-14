function centered_img = center_gray_image(img, scale = 255/2, offset = 2)
  mostLeftPos = columns(img);
  mostRightPos = 1;
  mostUpperPos = rows(img);
  mostLowerPos = 1;
  for i = 1:rows(img)
    for j = 1:columns(img)
      if(img(i, j) < scale)
        mostLeftPos = min(mostLeftPos, j);
        mostRightPos = max(mostRightPos, j);
        mostUpperPos = min(mostUpperPos, i);
        mostLowerPos = max(mostLowerPos, i);
      endif
    endfor
  endfor
  
  rowStart = max(mostUpperPos - offset, 1);
  rowEnd = min(mostLowerPos + offset, rows(img));
  columnStart = max(mostLeftPos - offset, 1);
  columnEnd = min(mostRightPos + offset, columns(img));
  
  centered_img = img(rowStart:rowEnd, columnStart:columnEnd);
  square_length = max(size(centered_img));
  empty_big_matrix = 255 - zeros(square_length * 2, 2 * square_length);
  
  rowStart = floor(square_length - rows(centered_img)/2);
  rowEnd = rowStart + rows(centered_img) - 1;
  columnStart = floor(square_length - columns(centered_img)/2);
  columnEnd = columnStart + columns(centered_img) - 1;
  empty_big_matrix(rowStart:rowEnd, columnStart:columnEnd) = centered_img;
  
  rowStart = floor(square_length/2);
  rowEnd = rowStart + square_length;
  columnStart = floor(square_length/2);
  columnEnd = columnStart + square_length;
  centered_img = empty_big_matrix(rowStart:rowEnd, columnStart:columnEnd);
end