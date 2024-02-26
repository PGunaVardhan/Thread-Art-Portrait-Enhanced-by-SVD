% Read the noisy image
noisyImage = imread('sample.jpeg');

% Convert the image to grayscale if it is in RGB format
if size(noisyImage, 3) == 3
    noisyImage = rgb2gray(noisyImage);
end

% Perform Singular Value Decomposition (SVD) on the noisy image matrix
[U, S, V] = svd(double(noisyImage));

% Specify the number of singular values to keep for denoising
numSingularValues = 100; % Adjust this parameter as per your requirement

% Set the singular values beyond the specified threshold to zero
S(numSingularValues+1:end, numSingularValues+1:end) = 0;

% Reconstruct the denoised image using the modified singular values
denoisedImage = U * S * V';

% Convert the denoised image to uint8 format (8-bit) and rescale the values
denoisedImage = uint8(255 * mat2gray(denoisedImage));

% Display the noisy image and the denoised image
subplot(1, 2, 1);
imshow(noisyImage);
title('Noisy Image');

subplot(1, 2, 2);
imshow(denoisedImage);
title('Denoised Image');
