function color_faceoffDots_mask = faceoffDotSegInterface(Mask, im)
[m,n,p] = size(im);
faceoffDotsMask = Mask==1;
faceoffDotsMask= bwareafilt(faceoffDotsMask, 2);
blocations = bwboundaries(faceoffDotsMask,'noholes');

fig_h9 = figure; 
imshow(im, []);

ButtonH=uicontrol('Parent',fig_h9,'Style','pushbutton', ...
'String','Close Window','Units','pixels', ...
'Position',[10 10 100 37],'Visible','on', ...
'Callback',{@button_Callback});

for ind = 1:numel(blocations)
    % Convert to x,y order.
%         pos = blocations{ind};
%         pos = fliplr(pos);
    % Create a freehand ROI.
%         drawfreehand('Position', pos);

    % Convert to x,y order.
    pos = blocations{ind};
    x = pos(1:3:end,1);
    y = pos(1:3:end,2);

    % from the model approximate ellipse
    rotated_ellipse = fit_ellipse2( x,y );
    rotated_ellipse(rotated_ellipse < 0 )= 1;
    col = round(rotated_ellipse(2,:));
    row = round(rotated_ellipse(1,:));
    col( col > n ) = n;
    col(col == 0 ) = 1;
    row(row > m) = m;
    row(row == 0) = 1;
    pos2(:, 1) = row;
    pos2(:, 2) = col;
    pos2 = fliplr(pos2);    
%        % Create a freehand ROI.
    drawfreehand('Position', pos2);
end

% Convert the goalCreases ROI 2 mask 
edited_faceoffDots_mask = ROI2mask(im);
tmp1 = zeros(m, n);
tmp1(edited_faceoffDots_mask == 1) = 255;
color_faceoffDots_mask = uint8(zeros(m, n, p));
color_faceoffDots_mask(:,:,1) = tmp1;
color_faceoffDots_mask(:,:,2) = tmp1;
color_faceoffDots_mask(:,:,3) = tmp1;

function button_Callback(source,eventdata) 
    close(fig_h9);
end

end