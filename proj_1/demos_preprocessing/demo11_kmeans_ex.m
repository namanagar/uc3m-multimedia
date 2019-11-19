clear variables;
close all;
clc;

chips = imread('coloredChips.png');
chipsLab = rgb2lab(chips);
A = chipsLab(:,:,2);
B = chipsLab(:,:,3);
K = 5;
[ind, C] = kmeans([A(:) B(:)], K, 'Replicates', 10);
chipsInd = zeros(size(A));
chipsInd(:) = ind;
figure(7)
subplot(1,2,1);
imshow(chips,[]);
subplot(1,2,2);
imagesc(chipsInd);
axis image;