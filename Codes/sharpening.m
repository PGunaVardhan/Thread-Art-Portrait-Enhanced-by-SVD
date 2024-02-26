% Read the image
blurImage = imread('sample.jpeg');

% Convert the image to grayscale if it is in RGB format
if size(blurImage, 3) == 3
    blurImage = rgb2gray(blurImage);
end

% Perform Singular Value Decomposition (SVD) on the image matrix
[U, S, V] = svd(double(blurImage));

% Specify the percentage of singular values to retain
sharpnessFactor = 0.8;

% Compute the number of singular values to keep
numSingularValues = round(sharpnessFactor * min(size(blurImage)));

% Set the singular values beyond the specified threshold to zero
S(numSingularValues+1:end, numSingularValues+1:end) = 0;

% Reconstruct the image using the modified singular values
sharpImage = U * S * V';

% Convert the sharp image to uint8 format (8-bit) and rescale the values
sharpImage = uint8(255 * mat2gray(sharpImage));

% Display the original image and the sharp image
subplot(1, 2, 1);
imshow(blurImage);
title('Original Image');

subplot(1, 2, 2);
imshow(sharpImage);
title('Sharp Image');