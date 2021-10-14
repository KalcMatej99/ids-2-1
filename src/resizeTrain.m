function resized = resizeTrain()
    vhod = dlmread("./../data/train.csv");
    resized = [];
    for i = 1:rows(vhod)
        label = vhod(i, 1);
        row = vhod(i, 2:end);
        im28x28 = reshape(row, [28, 28])';
        im16x16 = imresize(im28x28, [16, 16], 'nearest');
        im16x16row = reshape(im16x16', [1, 256]);
        resized = [resized; [label, im16x16row]];
    end
    dlmwrite('./../data/trainDataMatrixWithLabels.csv', resized, ",");
end