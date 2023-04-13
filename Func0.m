function [Funcmssim, DerFuncmssim] = Func0(x,y, H,K, window, L)

%   X: K x N are K vectors of length N
x=x(:);
x=H*x;
x=reshape(x,[128,128]);
[M,N1] = size(y);
m=0;
sum1=0;
sum2=0;
N=M/128;
for l=1:N
    p1=128*m+1;
    p2=128*l;
    Y=y([p1:p2],:);
    [S1,S3,S2]=new_ssim(x, Y,K,window, L);
    S2=S2(:);
    S2=H'*S2;
    S2=reshape(S2,[256,256]);
    sum1=sum1+S1;
    sum2=sum2+S2;
    m=m+1;
    
end
Funcmssim= 1-sum1;
DerFuncmssim= -sum2;
end

