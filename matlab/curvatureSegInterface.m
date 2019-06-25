function color_curvatures_mask = curvatureSegInterface(Mask, im)

[m,n,p] = size(im);
curvaturesMask = Mask==1;
curvaturesMask= bwareafilt(curvaturesMask, 4);
blocations = bwboundaries(curvaturesMask,'noholes');

fig_h6 = figure; 
imshow(im, []);

ButtonH=uicontrol('Parent',fig_h6,'Style','pushbutton', ...
'String','Close Window','Units','pixels', ...
'Position',[10 10 100 37],'Visible','on', ...
'Callback',{@button_Callback});

for ind = 1:numel(blocations)
    % Convert to x,y order.
    pos = blocations{ind};
    %downsample the pos with factor 3
    %pos2(:,1) = pos(1:30:end, 1) ;
    %pos2(:,2) = pos(1:30:end, 2);
    pos = fliplr(pos);
    % Create a freehand ROI.
    drawfreehand('Position', pos);
end

% Convert the goalCreases ROI 2 mask 
edited_curvatures_mask = ROI2mask(im);
tmp1 = zeros(m, n);
tmp2 = zeros(m, n);
tmp3 = zeros(m, n);
tmp1(edited_curvatures_mask == 1) = 255;
tmp2(edited_curvatures_mask == 1) = 102;
tmp3(edited_curvatures_mask == 1) = 153;
color_curvatures_mask = uint8(zeros(m, n, p));
color_curvatures_mask(:,:,1) = tmp1;
color_curvatures_mask(:,:,2) = tmp2;
color_curvatures_mask(:,:,3) = tmp3;

function button_Callback(source,eventdata) 
    close(fig_h6);
end

end