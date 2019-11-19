clear variables;
close all;

% Load the image into memory
im = imread('peppers.png');

% Convert to grayscale: MxNx3 -> MxN
im = rgb2gray(im);

% Add impulsive noise with probability 0.05
im = imnoise(im, 'salt & pepper', 0.05);

n = 21; % Assign filter size

% Compute the median filter
im_filtered = medfilt2(im, [n, n]);

figure(1);
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im_filtered, []);