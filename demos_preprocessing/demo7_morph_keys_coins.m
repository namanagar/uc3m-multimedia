clear variables;
close all;

im = imread('keys_and_coins.png');
im = rgb2gray(im);
figure(1), imshow(im);

bwim = ~im2bw(im, 0.72);

figure(2), imshow(bwim);

str_el = strel('octagon', 3);
bwim = imopen(imclose(bwim, str_el), str_el);
figure(3), imshow(bwim);

bwim = imfill(bwim, 'holes');
figure(4), imshow(bwim);

rprops = regionprops(bwim, 'Area', 'ConvexArea', 'Eccentricity', 'PixelIdxList');

data_matrix = [[rprops.Area] ./ [rprops.ConvexArea]; rprops.Eccentricity];

im_keys = false(size(bwim));
im_coins = false(size(bwim));
for i = 1:length(rprops)
    if rprops(i).Eccentricity > 0.5
        im_keys(rprops(i).PixelIdxList) = 1;
    else
        im_coins(rprops(i).PixelIdxList) = 1;
    end
end
figure(5), imshow(im_keys);
figure(6), imshow(im_coins);