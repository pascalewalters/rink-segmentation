function color_refCrease_mask = refCreaseSegInterface(Mask, im)

[m,n,p] = size(im);
refCreaseMask = Mask==1;
refCreaseMask= bwareafilt(refCreaseMask, 2);
blocations = bwboundaries(refCreaseMask,'noholes');

fig_h10 = figure; 
imshow(im, []);

ButtonH=uicontrol('Parent',fig_h10,'Style','pushbutton', ...
'String','Close Window','Units','pixels', ...
'Position',[10 10 100 37],'Visible','on', ...
'Callback',{@button_Callback});

for ind = 1:numel(blocations)
    % Convert to x,y order.
    pos = blocations{ind};
    pos = fliplr(pos);
    % Create a freehand ROI.
    drawfreehand('Position', pos);
end

% Convert the goalCreases ROI 2 mask 
edited_refCrease_mask = ROI2mask(im);
tmp1 = zeros(m, n);
tmp1(edited_refCrease_mask == 1) = 255;
color_refCrease_mask = uint8(zeros(m, n, p));
color_refCrease_mask(:,:,1) = tmp1;
color_refCrease_mask(:,:,3) = tmp1;

function button_Callback(source,eventdata) 
    close(fig_h10);
end

end