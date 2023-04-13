function [Funcmssim, DerFuncmssim] = Func(x,y, K, window, L)

%   X: K x N are K vectors of length N
[M,N] = size(y);
m=0;
sum1=0;
sum2=0;
N=M/256;
for l=1:N
    p1=256*m+1;
    p2=256*l;
    Y=y([p1:p2],:);
    [S1,S3,S2]=new_ssim(x, Y,K,window, L);
    sum1=sum1+S1;
    sum2=sum2+S2;
    m=m+1;
    
end
Funcmssim=N-sum1;
DerFuncmssim=-sum2;
end

