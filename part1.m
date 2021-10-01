I = imread("1.png");
grayImage = rgb2gray(I);
subplot(3,1,1),imshow(grayImage);

constant = 1;
double_value = im2double(grayImage);

%log transformations  
%log_transformations1 = constant*log(1+grayImage);

%inverse log transformations
%inverse_log_transformations = exp(double_value/0.3)-1;

%power law transforamtions
%power_law_transforamtions = 1*(double_value.^3);

%power law transforamtions
power_law_transforamtions1 = 1*(double_value.^3);
%subplot(3,1,2),imshow((power_law_transforamtions1));
power_law_transforamtions = 1*(double_value.^0.3);
%subplot(3,1,3),imshow((power_law_transforamtions));

% plane_image0 = bitget(grayImage,1);
% plane_image1 = bitget(grayImage,2);
% plane_image2 = bitget(grayImage,3);
% plane_image3 = bitget(grayImage,4);
% plane_image4 = bitget(grayImage,5);
% plane_image5 = bitget(grayImage,6);
% plane_image6 = bitget(grayImage,7);
% plane_image7 = bitget(grayImage,8);
% two = plane_image7*128+plane_image6*64+plane_image5*32+plane_image4*16;
% imshow((two));
%imhist(grayImage,64)

gh = histeq(power_law_transforamtions1);
subplot(2,2,1),imshow(power_law_transforamtions1),title("Original Image (Gray) γ = 3.0: ");
subplot(2,2,2),imshow(gh),title("Equalized Image (Gray)  γ = 3.0:");
subplot(2,2,3),imhist(power_law_transforamtions1),title("Histogram of Image (Gray)  γ = 3.0:");
subplot(2,2,4),imhist(gh),title("Histogram of Equalized Image (Gray)  γ = 3.0:");


