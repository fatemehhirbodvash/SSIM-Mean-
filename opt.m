function x=opt(x,y,Lambda, K, window,L)
%Input : (1) x: an image which is considered as initial point of the
%           numerical methods
%        (2) y: an array which consised of all degraded images;
%        (3) K: constants in the SSIM index formula (see the above
%            reference). defualt value: K = [0.01 0.03];
%        (4) window: local window for statistics (see the above
%            reference). default widnow is Gaussian given by
%            window = fspecial('gaussian', 11, 1.5);
%        (5) L: dynamic range of the images. default: L = 255;
%Output: (1) x: the optimal image which is obtained by merging input images

x=double(x);
y=double(y);
g=DEROBJ(x, y,Lambda, K, window, L);
% Begin method

T=20;% Stopping time;
dt=0.1; % Time step

a=0.001;
for t = 0:dt:T 
    d=-g;
    x = x+ a*d;
    g=DEROBJ(x, y,Lambda, K, window, L);
    
end

x=uint8(x);
end
