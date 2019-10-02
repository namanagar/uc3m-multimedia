clear variables;
close all;

im = imread('peppers.png');
im = rgb2gray(im);

im = im2double(im);

im = imnoise(im, 'salt & pepper', 0.05);

%%% Build manually a box filter
n = 11; % Select the size

% Compute the average dividing by the number
% of elements of the kernel
h = 1 / n^2 * ones(n, n);

im_filtered = imfilter(im, h);

figure(1);
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im_filtered, []);