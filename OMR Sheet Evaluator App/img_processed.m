function p_img=img_processed(image)
    igs=im2gray(image); % convers given image to gray scale
    bw = imbinarize(igs);   % convers gray scale image to binary image
    p_img = ~bw ; % inverts binary image
end