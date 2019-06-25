function color_faceoffDots_mask = segmentFaceoffDots(im, faceoffDots_mask)

Mask = faceoffDots_mask(:,:,1) > (50 / 255.0);
[m, n, p] = size(im);
color_faceoffDots_mask = uint8(zeros(m,n,p));

if sum(sum(sum(Mask))) > 0
    color_faceoffDots_mask = faceoffDotSegInterface(Mask, im);
end