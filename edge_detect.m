%edge detect
IMG = imread('teapot.png');
scale = 1280/sum(size(IMG));
IMG = imresize(IMG,scale);

BW = edge(IMG(:,:,1),'Canny');
outlinetarget = find(BW == 1);
IMG(outlinetarget) = 255;

imwrite(IMG,'edgeoutput.png');