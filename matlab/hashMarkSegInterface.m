function color_hashMarks_mask = hashMarkSegInterface(Mask, im)

[m,n,p]= size(im);
hashMarksMask = Mask==1;
hashMarksMask= bwareafilt(hashMarksMask, 8);
blocations = bwboundaries(hashMarksMask,'noholes');

fig_h7 = figure; 
imshow(im, []);

ButtonH=uicontrol('Parent',fig_h7,'Style','pushbutton', ...
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
edited_hashMarks_mask = ROI_line2mask(im,thickness);
tmp1 = zeros(m, n);
tmp2 = zeros(m, n);
tmp3 = zeros(m, n);
tmp1(edited_hashMarks_mask == 1) = 204;
tmp2(edited_hashMarks_mask == 1) = 153;
tmp3(edited_hashMarks_mask == 1) = 255;
color_hashMarks_mask = uint8(zeros(m, n, p));
color_hashMarks_mask(:,:,1) = tmp1;
color_hashMarks_mask(:,:,2) = tmp2;
color_hashMarks_mask(:,:,3) = tmp3;

function button_Callback(source,eventdata) 
    close(fig_h7);
end

end