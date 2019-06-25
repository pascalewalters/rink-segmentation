function color_vlines_mask = segmentVLines(im, vlines_mask)

Mask = vlines_mask(:,:,1) > (50 / 255.0);
[m, n, p] = size(im);
color_vlines_mask = uint8(zeros(m,n,p));

if sum(sum(sum(Mask))) > 0
    color_vlines_mask = vlineSegInterface(Mask,im);
end
