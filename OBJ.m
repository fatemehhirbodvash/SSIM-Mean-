function [obj] = OBJ(x, y,Lambda, K, window, L)

%
[R1,R2]=Func(x, y, K, window, L);
[R3,R4]=reg(x);

obj=Lambda.*R3+R1;

end

