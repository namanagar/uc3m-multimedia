%% Example threshold segmentation
close all;
I=imread('termica.jpg');
I=rgb2gray(I);
figure;imshow(I,[]);
histI=imhist(I);
figure;bar(histI);
th=30;
seg1=im2bw(I,th/255);
th=170;
seg2=im2bw(I,th/255);
figure;subplot(1,2,1);imshow(seg1,[]);title('th=30');
subplot(1,2,2);imshow(seg2,[]);title('th=170');