function [Derobj] = DEROBJ0(x, y,H,Lambda, K, window, L)
%UNTITLED5 Summary of this function goes here
%
[R1,R2]=Func0(x,y,H, K, window, L);
[R3,R4]=reg(x);

Derobj=Lambda.*R4+R2;
end