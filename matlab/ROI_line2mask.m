function editedMask = ROI_line2mask(im , thickness)
    % Method 1- convert edited ROI to masks
    hfhs = findobj(gca, 'Type', 'images.roi.Line');
    [m, n, p] = size(im);
    editedMask = zeros(m, n);      
    for ind = 1:numel(hfhs)
        % Accumulate the mask from each ROI
        editedMask = editedMask | hfhs(ind).createMask();
        boundaryLocation = hfhs(ind).Position;
        bInds = sub2ind(size(im), boundaryLocation(:,2), boundaryLocation(:,1));
        editedMask(bInds) = 1;
    end
    editedMask = double(editedMask); 
    se = strel('line', thickness, 0);
    editedMask = imdilate(editedMask,se);
       
%     for ind = 1:numel(hfhs)
%     %   Accumulate the mask from each ROI  
%         xi = round( hfhs(ind).Position(:,1));
%         yi = round( hfhs(ind).Position(:,2));
%         BW = poly2mask(xi,yi,m,n);
%         editedMask = editedMask | BW;
%     end

%%
%     % Method 2- Convert edited ROI back to masks.
%     
%     editedMask = false(size(im));
%        
%     for ind = 1:numel(hfhs)
%         % Accumulate the mask from each ROI
%         editedMask = editedMask | hfhs(ind).createMask();
%         boundaryLocation = hfhs(ind).Position;
%         bInds = sub2ind(size(im), boundaryLocation(:,2), boundaryLocation(:,1));
%         editedMask(bInds) = true;
%     end
%     editedMask = double(editedMask);
 
end