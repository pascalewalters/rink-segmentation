function color_curvatures_mask = segmentCurvatures(im, curvatures_mask)

Mask = curvatures_mask(:,:,1) > (50 / 255.0);
[m, n, p] = size(im);
color_curvatures_mask = uint8(zeros(m,n,p));

if sum(sum(sum(Mask))) > 0
    color_curvatures_mask = curvatureSegInterface(Mask, im);
end
