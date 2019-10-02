clear variables;
close all;

im = imread('im_to_close.png');
im = rgb2gray(im);
im = im2bw(im, 0.95);

figure(1), imshow(im);

str_el = strel('disk', 9, 0);
imdil = imdilate(im, str_el);
figure(2), imshow(imdil);

im_cl = imerode(imdil, str_el);
figure(3), imshow(im_cl);