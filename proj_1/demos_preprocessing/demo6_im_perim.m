clear variables;
close all;

im = imread('circles.png');

im = imfill(im, 'holes');
im_eroded = imerode(im, strel('square', 3));
imperim = im - im_eroded;

figure(1), imshow(im);
figure(2), imshow(im_eroded);
figure(3), imshow(imperim);