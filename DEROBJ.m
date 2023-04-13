function [Derobj] = DEROBJ(x, y,Lambda, K, window, L)
%UNTITLED5 Summary of this function goes here
%
[R1,R2]=Func(x,y, K, window, L);
[R3,R4]=reg(x);
%R2=R2(:);
%R2=R2';
%R4=R4(:);
%R4=R4';
Derobj=R2+Lambda.*R4;
end