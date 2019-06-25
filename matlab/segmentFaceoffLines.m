function color_faceoffLines_mask = segmentFaceoffLines(im, faceoffLines_mask)

Mask = faceoffLines_mask(:,:,1) > (50 / 255.0);
[m, n, p] = size(im);
color_faceoffLines_mask = uint8(zeros(m,n,p));

if sum(sum(sum(Mask))) > 0
    color_faceoffLines_mask = faceoffLineSegInterface(Mask, im);
    
end
   