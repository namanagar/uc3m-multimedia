%% Example horizontal borders
close all;
I=[128*ones(50,200); 255*ones(50,200); 0*ones(50,200); 255*ones(50,200); 128*ones(50,200)];

figure;imshow(I,[])
mask=[1 2 1; 0 0 0; -1 -2 -1];
output=imfilter(I,mask);
figure;imshow(output,[]);
figure;imshow(abs(output),[]);

mask=-1*mask;
output=imfilter(I,mask);
figure;imshow(output,[]);
% figure;imshow(abs(output),[]);