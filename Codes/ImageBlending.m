% Read the source and destination images
sourceImage = imread('sample.jpeg');
destinationImage = imread('sample.jpeg');

% Convert the images to double precision for calculations
sourceImage = im2double(sourceImage);
destinationImage = im2double(destinationImage);

% Compute the size of the images
[height, width, ~] = size(sourceImage);

% Perform Fourier Transform on the images
sourceImageF = fft2(sourceImage);
destinationImageF = fft2(destinationImage);

% Define the blending mask
maskWidth = 50;  % Width of the blending region
mask = zeros(height, width);
mask(:, 1:maskWidth) = 1;

% Perform image blending in the frequency domain
blendedImageF = sourceImageF .* mask + destinationImageF .* (1 - mask);

% Compute the inverse Fourier Transform to obtain the blended image
blendedImage = real(ifft2(blendedImageF));

% Display the blended image
imshow(blendedImage);
