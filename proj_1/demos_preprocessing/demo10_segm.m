clear variables;
close all;

im = imread('coins.png');
threshold = 100;

im_bin = im > 100;
im_bin = imfill(im_bin, 'holes');

labeled_im = bwlabel(im_bin, 8);

color_labels_im = label2rgb (labeled_im, 'hsv', 'k', 'shuffle'); % pseudo random color labels

figure(1), imshow(im);
figure(2), imshow(im_bin);
figure(3), imshow(color_labels_im);