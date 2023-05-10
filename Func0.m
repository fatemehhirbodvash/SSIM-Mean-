function [Funcmssim, DerFuncmssim] = Func0(x,y, H,K, window, L, num)

%   Y: K x N are K vectors of length N
[LLX,WWX]=size(x);
x=x(:);
x=H*x;
[M,N1] = size(y);
LX=M/ num;
x=reshape(x,[LX,N1]);
m=0;
sum1=0;
sum2=0;
N=M/LX;
for l=1:N
    p1=LX*m+1;
    p2=LX*l;
    Y=y([p1:p2],:);
    [S1,S3,S2]=new_ssim(x, Y,K,window, L);
    S2=S2(:);
    S2=H'*S2;
    S2=reshape(S2,[LLX,WWX]);
    sum1=sum1+S1;
    sum2=sum2+S2;
    m=m+1;
    
end
Funcmssim= 1-sum1;
DerFuncmssim= -sum2;
end

