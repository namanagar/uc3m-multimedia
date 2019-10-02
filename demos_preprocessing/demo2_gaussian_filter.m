%% Example gaussian filter
close all;
I = imread('cameraman.tif');
gauss1 = fspecial('gaussian',21,6);
output=imfilter(I,gauss1);
figure;imshow(I,[]);
figure;imshow(output,[]);
figure;imshow(gauss1,[]);