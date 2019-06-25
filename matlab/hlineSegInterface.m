function color_hlines_mask = hlineSegInterface(Mask, im)

[m,n,p] = size(im);
hlinesMask = Mask==1;
hlinesMask= bwareafilt(hlinesMask, 7);
blocations = bwboundaries(hlinesMask,'noholes');

fig_h5 = figure; 
imshow(im, []);

ButtonH=uicontrol('Parent',fig_h5,'Style','pushbutton', ...
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
edited_hlines_mask = ROI_line2mask(im,thickness);
tmp1 = zeros(m, n);
tmp1(edited_hlines_mask == 1) = 102;
color_hlines_mask = uint8(zeros(m, n, p));
color_hlines_mask(:,:,1) = tmp1;
color_hlines_mask(:,:,3) = tmp1;


function button_Callback(source,eventdata) 
    close(fig_h5);
end

end