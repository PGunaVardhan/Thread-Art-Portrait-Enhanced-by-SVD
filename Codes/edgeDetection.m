% Load the image
image = imread('sample.jpeg');

% Convert the image to grayscale
grayImage = rgb2gray(image);

% Perform SVD on the grayscale image
[U, S, V] = svd(double(grayImage));

% Set the number of singular values to keep (adjust this as needed)
numSingularValues = 200;

% Reconstruct the image using the selected singular values
reconstructedImage = U(:, 1:numSingularValues) * S(1:numSingularValues, 1:numSingularValues) * V(:, 1:numSingularValues)';

% Apply edge detection on the reconstructed image
edges = edge(reconstructedImage, 'log');

% Display the original image and the detected edges
figure;
subplot(1, 2, 1);
imshow(grayImage);
title('Original Image');
subplot(1, 2, 2);
imshow(edges);
title('Detected Edges');
