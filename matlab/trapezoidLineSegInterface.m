function color_trapezoidLines_mask = trapezoidLineSegInterface(Mask, im)

[m , n , p] = size(im);
trapezoidLinesMask = Mask==1;

trapezoidLinesMask= bwareafilt(trapezoidLinesMask, 4);
blocations = bwboundaries(trapezoidLinesMask,'noholes');

fig_h3 = figure; 
imshow(im);

ButtonH=uicontrol('Parent',fig_h3,'Style','pushbutton', ...
'String','Close Window','Units','pixels', ...
'Position',[10 10 100 37],'Visible','on', ...
'Callback',{@button_Callback});

for ind = 1:numel(blocations)
    % Convert to x,y order.
    pos = blocations{ind};
    [M , I] = min(pos(:,1));
    [M , II] = max(pos(:,1));
    pos_end = [pos(I, 1) , pos(I, 2); pos(II, 1) , pos(II, 2) ];
    pos_end = fliplr(pos_end);
    % Create a freehand ROI.
    drawline('Position', pos_end,'LineWidth',5 );
end
% Convert the goalCreases ROI 2 mask 
thickness = 9;
edited_trapezoidLines_mask = ROI_line2mask(im,thickness);

tmp1 = zeros(m, n);
tmp1(edited_trapezoidLines_mask == 1) = 255;
color_trapezoidLines_mask = uint8(zeros(m, n, p));
color_trapezoidLines_mask(:,:,2) = tmp1;
color_trapezoidLines_mask(:,:,3) = tmp1;

function button_Callback(source,eventdata) 
    close(fig_h3);
end

end
