clear variables;
close all;

% Load the image into memory
im = imread('peppers.png');

% Convert to grayscale: MxNx3 -> MxN
%im = rgb2gray(im);

% Add impulsive noise with probability 0.05
im = imnoise(im, 'salt & pepper', 0.05);

n = 3; % Assign filter size

% Compute the median filter
im_filtered = zeros(size(im));
for i = 1:3
    im_filtered(:,:,i) = medfilt2(im(:,:,i), [n, n]);
end

figure(1), imshow(im);
figure(2), imshow(im_filtered / 255);