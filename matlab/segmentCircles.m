function color_circles_mask = segmentCircles(im, circles_mask)

Mask = circles_mask(:,:,1) > (50 / 255.0);
[m, n, p] = size(im);
color_circles_mask = uint8(zeros(m,n,p));

if sum(sum(sum(Mask))) > 0 
    color_circles_mask = circleSegInterface(Mask,im);
end
