A = imread('2.jpg');
AInv = imcomplement(A);
BInv = imreducehaze(AInv);
B = imcomplement(BInv);
montage({A,B});