function color_faceoffLines_mask = faceoffLineSegInterface(Mask, im)

[m,n,p] = size(im);
% Mask = bwmorph(Mask , 'remove');
%Mask = bwmorph(Mask,'skel',Inf);
%     thickness = 3;
%     se = strel('line', thickness, 0);
%     Mask = imerode(Mask,se);
%figure;imshow(Mask)

faceoffLinesMask = Mask==1;
faceoffLinesMask= bwareafilt(faceoffLinesMask, 12);
blocations = bwboundaries(faceoffLinesMask,'noholes');

fig_h8 = figure; 
imshow(im, []);

ButtonH=uicontrol('Parent',fig_h8,'Style','pushbutton', ...
'String','Close Window','Units','pixels', ...
'Position',[10 10 100 37],'Visible','on', ...
'Callback',{@button_Callback});

for ind = 1:numel(blocations)
    % Convert to x,y order.
    pos = blocations{ind};
    [M,I1] = min(pos(:,1));
    [M,I2] = max(pos(:,1));
    [M,I3] = min(pos(:,2));
    [M,I4] = max(pos(:,2));
    inds = [I1,I2,I3,I4];
    [M, I]= sort(inds,'ascend');
    POS = [pos(inds(I(1)), 1) , pos(inds(I(1)), 2); pos(inds(I(2)), 1) , pos(inds(I(2)), 2); pos(inds(I(3)), 1) , pos(inds(I(3)), 2);pos(inds(I(4)), 1) , pos(inds(I(4)), 2) ];
    %[M,I] = sort(p(:,1),'ascend');
    %p2(:,1) = p(I, 1);
    %p2(:,2) = p(I, 2);
    %pos_end = [pos(I1, 1) , pos(I1, 2); pos(I2, 1) , pos(I2, 2); pos(I3, 1) , pos(I3, 2); pos(I4, 1) , pos(I4, 2)];
    pos = fliplr(pos);
    POS = fliplr(POS);
    % Create a freehand ROI.
    %drawpolyline('Position', p,'LineWidth',5 );

    % Create a freehand ROI.       
    drawfreehand('Position', pos);
end

% Convert the goalCreases ROI 2 mask 
%    edited_faceoffLines_mask = ROI_polyline2mask(im);
edited_faceoffLines_mask = ROI2mask(im);
tmp1 = zeros(m, n);
tmp2 = zeros(m, n);
tmp3 = zeros(m, n);
tmp1(edited_faceoffLines_mask == 1) = 102;
tmp2(edited_faceoffLines_mask == 1) = 153;
tmp3(edited_faceoffLines_mask == 1) = 255;
color_faceoffLines_mask = uint8(zeros(m, n, p));
color_faceoffLines_mask(:,:,1) = tmp1;
color_faceoffLines_mask(:,:,2) = tmp2;
color_faceoffLines_mask(:,:,3) = tmp3;

function button_Callback(source,eventdata) 
    close(fig_h8);
end

end