function color_circles_mask = circleSegInterface(Mask, im)

[m, n, p] = size(im);
circlesMask = Mask==1;

circlesMask= bwareafilt(circlesMask, 5); 
blocations = bwboundaries(circlesMask);

fig_h1 = figure;  % Open the figure with handle fig_h
imshow(im)

ButtonH=uicontrol('Parent',fig_h1,'Style','pushbutton', ...
    'String','Close Window','Units','pixels', ...
    'Position',[10 10 100 37],'Visible','on', ...
    'Callback',{@button_Callback});

for ind = 1:numel(blocations)
    % Convert to x,y order.
    pos = blocations{ind};
    x = pos(1:3:end-1,1);
    y = pos(1:3:end-1,2);
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
    % Create a freehand ROI.
    drawfreehand('Position', pos2);
end

% Convert the Circles ROI 2 mask 
% pause does not work on Java app
edited_circles_mask = ROI2mask(im);
color_circles_mask = uint8(zeros(m,n,p));
tmp1 = zeros(m, n);
tmp1(edited_circles_mask == 1) = 255; 
color_circles_mask(:, : , 1) = tmp1;
color_circles_mask(:, : , 2) = tmp1;

function button_Callback(source,eventdata) 
    close(fig_h1);
end

end