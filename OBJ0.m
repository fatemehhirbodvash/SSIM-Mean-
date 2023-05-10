function [obj] = OBJ0(x, y,H,Lambda, K, window, L,num)

[R1,R2]=Func0(x, y,H, K,window, L,num);
[R3,R4]=reg(x);

obj=R1+Lambda.*R3;

end