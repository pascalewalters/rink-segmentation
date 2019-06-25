function color_hashMarks_mask = segmentHashMarks(im, hashMarks_mask)

Mask = hashMarks_mask(:,:,1) > (50 / 255.0);
[m, n, p] = size(im);
color_hashMarks_mask = uint8(zeros(m,n,p));

if sum(sum(sum(Mask))) > 0
    color_hashMarks_mask = faceoffLineSegInterface(Mask, im);
    
end
