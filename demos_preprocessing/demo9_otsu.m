%% Example Otsu
close all;
th=graythresh(I);
seg3=im2bw(I,th);
figure;imshow(seg3,[]);title('Otsu');
