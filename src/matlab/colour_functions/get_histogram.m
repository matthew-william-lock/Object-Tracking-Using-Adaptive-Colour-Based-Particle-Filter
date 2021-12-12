% This file is to return colour histogram of region in an image
%
% "3D Trajectory Prediction of Basketball Shot Using Filtering Techniques
% and Computer Vision" project. The project is a self picked topic for implementation
% in the Appied Estimation course at% the KTH Royal Institute of Technology in 2021.
%
% Authors : 
% Matthew William Lock (mwlock@kth.se)
% Miguel Garcia Naude (magn2@kth.se)

% observation likelihood
%           image                
%           binaryImage
% Outputs: 
%           histogram            3X8    

function histogram = get_histogram(image, binaryImage) 
    
    % Get masked region
    reference_frame = reshape(image, [], 3);
    mask_reshaped = reshape(binaryImage, [], 1);
    masked_pixels = reference_frame(mask_reshaped,:);
    masked_pixels = reshape(masked_pixels, [], 1, 3);
    
    % convert RGB to HSV
    masked_pixels_HSV = rgb2hsv(masked_pixels);
    
    % Get Colours histogram

    [h_counts,~] = imhist(masked_pixels_HSV(:,:,1),8);
    h_counts = h_counts';

    [s_counts,~] = imhist(masked_pixels_HSV(:,:,2),8);
    s_counts = s_counts';

    [v_counts,~] = imhist(masked_pixels_HSV(:,:,3),4);
    v_counts = v_counts';
    v_counts(8)=0;
    
    % Generate target histogram
    histogram = [h_counts;s_counts;v_counts];