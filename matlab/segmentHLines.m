function color_hlines_mask = segmentHLines(im, hlines_mask)

Mask = hlines_mask(:,:,1) > (50 / 255.0);
[m, n, p] = size(im);
color_hlines_mask = uint8(zeros(m,n,p));

if sum(sum(sum(Mask))) > 0
    color_hlines_mask = hlineSegInterface(Mask, im);
end

% hlines_mask = imread(strcat(currentFolder, '\rinkInfo\test_out\', 'hlines_mask' , name , '.jpg'));    
% imwrite(color_hlines_mask, strcat(currentFolder, '\rinkInfo\output_masks\', 'color_hlines_mask', name, '.jpg'));