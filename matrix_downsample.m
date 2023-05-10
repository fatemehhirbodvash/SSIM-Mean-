function H=matrix_downsample(I,z)
%Input: I= image z=downsampling factor

[Ah,Aw]=size(I);
A=sparse(Ah-z+1,Ah);
for i=1:Ah-z+1
    for j=i:i+z-1
        A(i,j)=1;
        end;
end;
B=kron(A,A)/z^2;
I=speye(Ah,Ah-z+1);
Q=I(1:z:Ah-z+1,:);
D=kron(Q,Q);
H=D*B;
end
