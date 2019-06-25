function color_goalCreases_mask = segmentGoalCreases(im, goalCreases_mask)

Mask = goalCreases_mask(:,:,1) > (50 / 255.0);
[m, n, p] = size(im);
color_goalCreases_mask = uint8(zeros(m,n,p));

if sum(sum(sum(Mask))) > 0 
    color_goalCreases_mask = goalCreaseSegInterface(Mask,im);
end
