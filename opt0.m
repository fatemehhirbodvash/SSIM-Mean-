function x=opt0(x,y,H,Lambda, K, window,L)
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
g=DEROBJ0(x, y,H,Lambda, K, window, L);

T=5;
dt=0.01;
%obj = OBJ(x, y,Lambda, K, window, L);
%sigma = .01;
%beta = .1;

for t = 0:dt:T 
    d=-g;
    %newobj = OBJ(x + a*d, y,Lambda, K, window, L);
    %while (newobj-obj) >a*sigma*g(:)' *d(:)
        %&& BBB<0.00001
     %   a = a*beta;
       %end 
    %end 
   %newobj = OBJ(x + a*d, y,Lambda, K, window, L);
    x = x+ dt*d;
    g=DEROBJ0(x, y,H,Lambda, K, window, L);
    %obj=newobj;
    
end

x=uint8(x);
end
