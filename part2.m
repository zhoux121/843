a = 0.5;
T = maketform("AFFINE", [1 0 0; a 1 0; 0 0 1]);

A = imread('2.jpg');
h1 = figure; imshow(A); title('Original Image');

orange = [205 227 0]';
B = imtransform(A,T,'cubic','FillValues',orange);

R = makeresampler({'cubic','nearest'},'fill');
B = imtransform(A,T,R,'FillValues',orange); 
h2 = figure; imshow(B);
title('Sheared Image');

[U,V] = meshgrid(0:64:900,0:64:630);
[X,Y] = tformfwd(T,U,V);
gray = 0.65 * [1 1 1];

figure(h1);
hold on;
line(U, V, 'Color',gray);
line(U',V','Color',gray);

figure(h2);
hold on;
line(X, Y, 'Color',gray);
line(X',Y','Color',gray);

gray = 0.65 * [1 1 1];
for u = 0:64:900
    for v = 0:64:630
        theta = (0 : 32)' * (2 * pi / 32);
        uc = u + 20*cos(theta);
        vc = v + 20*sin(theta);
        [xc,yc] = tformfwd(T,uc,vc);
        figure(h1); line(uc,vc,'Color',gray);
        figure(h2); line(xc,yc,'Color',gray);
    end
end

R = makeresampler({'cubic','nearest'},'fill');

Bf = imtransform(A,T,R,'XData',[-49 1500],'YData',[-49 750],...
                 'FillValues',orange);

figure, imshow(Bf);
title('Pad Method = ''fill''');

R = makeresampler({'cubic','nearest'},'replicate');
Br = imtransform(A,T,R,'XData',[-49 1500],'YData', [-49 750]);

figure, imshow(Br);
title('Pad Method = ''replicate''');

R = makeresampler({'cubic','nearest'}, 'bound');
Bb = imtransform(A,T,R,'XData',[-49 1500],'YData',[-49 750],...
                 'FillValues',orange);
figure, imshow(Bb);
title('Pad Method = ''bound''');

R = makeresampler({'cubic','nearest'},'fill');
Cf = imtransform(A,T,R,'XData',[423 439],'YData',[245 260],...
                 'FillValues',orange);

R = makeresampler({'cubic','nearest'},'bound');
Cb = imtransform(A,T,R,'XData',[423 439],'YData',[245 260],...
                 'FillValues',orange);

Cf = imresize(Cf,12,'nearest');
Cb = imresize(Cb,12,'nearest');

figure;
subplot(1,2,1); imshow(Cf); title('Pad Method = ''fill''');
subplot(1,2,2); imshow(Cb); title('Pad Method = ''bound''');

Thalf = maketform('affine',[1 0; a 1; 0 0]/2);

R = makeresampler({'cubic','nearest'},'circular');
Bc = imtransform(A,Thalf,R,'XData',[-49 1500],'YData',[-49 400],...
                 'FillValues',orange);
figure, imshow(Bc);
title('Pad Method = ''circular''');

R = makeresampler({'cubic','nearest'},'symmetric');
Bs = imtransform(A,Thalf,R,'XData',[-49 1500],'YData',[-49 750],...
                 'FillValues',orange);
figure, imshow(Bs);
title('Pad Method = ''symmetric''');