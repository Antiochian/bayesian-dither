function[] = dither(inputimage,edgethreshold);
%8x8 DITHERING FUNCTION
threshold = [ 0,48,12,60, 3,51,15,63; 32,16,44,28,35,19,47,31;8,56, 4,52,11,59, 7,55;40,24,36,20,43,27,39,23;2,50,14,62, 1,49,13,61;
34,18,46,30,33,17,45,29;10,58, 6,54, 9,57, 5,53;42,26,38,22,41,25,37,21];
%this is the 8x8 bayers threshold matrix

IMG = imread(inputimage);
scale = 1280/sum(size(IMG));
IMG = imresize(IMG,scale);

%EDGE TARGET DETECT
if nargin == 1
    BW = edge(IMG(:,:,1),'Prewitt');
else
    BW = edge(IMG(:,:,1),'Prewitt',edgethreshold);
end
outlinetarget = find(BW == 1);

%GRAYSCALE/NORMALISE/OUTLINE IMAGE
IMG = rgb2gray(IMG);
IMG = double(IMG)/64;  %normalise to 8-bit
IMG(outlinetarget) = 255;
%adjust size of threshold map
maxsize = max(size(IMG));
repno = ceil(maxsize/8);
threshold = repmat(threshold,repno);
threshold=threshold(1:size(IMG,1),1:size(IMG,2));

%THRESHOLD COMPARISON
signcheck = IMG - threshold;
targetsblk = find(signcheck < 0);
targetswht = find(signcheck >= 0);
IMG(targetsblk) = 0;
IMG(targetswht) = 255;


image(IMG);
imwrite(IMG,'output.jpg');
end