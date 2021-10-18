img = imread('1.jpg');
% subplot(4,2,1),imshow(img);
% subplot(4,2,2),imshow(edge(rgb2gray(img),'Roberts'));
% subplot(4,2,3),imshow(edge(rgb2gray(img),'Prewitt'));
% subplot(4,2,4),imshow(edge(rgb2gray(img),'Sobel'));


% % create gaussian filter
% h = fspecial('gaussian',5,2.5);
% % blur the image
% blurred_img = imfilter(rgb2gray(img),h);
% % subtract blurred image from original
% diff_img = rgb2gray(img) - blurred_img;
% % add difference to the original image
% highboost_img = rgb2gray(img) + 5*diff_img;
% unsharp_mask = rgb2gray(img) + 1*diff_img;
% imshow(highboost_img);

noise_image= imnoise(rgb2gray(img),'gaussian',1);
K = filter2(fspecial('average',5),noise_image)/255;
imshow(K);