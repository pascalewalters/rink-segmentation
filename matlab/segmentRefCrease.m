function color_refCrease_mask = segmentRefCrease(im, refCrease_mask)

Mask = refCrease_mask(:,:,1) > (50 / 255.0);
[m, n, p] = size(im);
color_refCrease_mask = uint8(zeros(m,n,p));

if sum(sum(sum(Mask))) > 0
    color_refCrease_mask = refCreaseSegInterface(Mask, im);
end