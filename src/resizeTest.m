function resized = resizeTest(vhod)
    resized = [];
    for i = 1:size(vhod,1)
        row = vhod(i, :);
        im28x28 = reshape(row, [28, 28])';
        im16x16 = imresize(im28x28, [16, 16], 'nearest');
        im16x16row = reshape(im16x16', [1, 256]);
        resized(end+1, :) = im16x16row;
    end
end