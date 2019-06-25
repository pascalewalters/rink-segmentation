function color_trapezoidLines_mask = segmentTrapezoids(im, trapezoidLines_mask)

Mask = trapezoidLines_mask(:,:,1) > (50 / 255.0);
[m, n, p] = size(im);
color_trapezoidLines_mask = uint8(zeros(m,n,p));

if sum(sum(sum(Mask))) > 0
    color_trapezoidLines_mask = trapezoidLineSegInterface(Mask, im);
    
end
