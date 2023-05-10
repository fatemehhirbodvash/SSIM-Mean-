function x=opt0(x,y,H,Lambda, K, window,L,num)
%Input : (1) x: an image which is considered as initial point of the
%           numerical methods
%        (2) y: an array which consised of all degraded images;
%        (3)H:degredation operator;
%        (4) K: constants in the SSIM index formula (see the above
%            reference). defualt value: K = [0.01 0.03];Num
%        (5) window: local window for statistics (see the above
%            reference). default widnow is Gaussian given by
%            window = fspecial('gaussian', 11, 1.5);
%        (6) L: dynamic range of the images. default: L = 255;
%        (7) num: number of input images;
%Output: (1) x: the optimal image which is obtained by merging input images

x=double(x);
y=double(y);
g=DEROBJ0(x, y,H,Lambda, K, window, L, num);

T=10;
dt=0.01;
for t = 0:dt:T 
    d=-g;
    x = x+ dt*d;
    g=DEROBJ0(x, y,H,Lambda, K, window, L, num);
    
end

x=uint8(x);
end
