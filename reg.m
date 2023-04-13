function [REG,DerREG] = reg(f)
u=f;
[m,n] = size(u);
 % 2nd derivatives
u_xx = u(:,[2:n,n]) - 2*u + u(:,[1,1:n-1]);
u_yy = u([2:m,m],:) - 2*u + u([1,1:m-1],:);
    % 2nd mixed partial derivatives
u_xy = ( u([2:m,m],[2:n,n] ) + u([1,1:m-1],[1,1:n-1]) ...
        - u([2:m,m],[1,1:n-1]) - u([1,1:m-1],[2:n,n] ) ) / 4;
u_yx = u_xy;
    % 1st partial derivatives (central difference)
u_x = ( u(:,[2:n,n]) - u(:,[1,1:n-1]) ) / 2;
u_y = ( u([2:m,m],:) - u([1,1:m-1],:) ) / 2;
% u_x = u(:,[2:n,n]) - u; % forward difference 
 % u_y = u([2:m,m],:) - u; % forward difference 
A=u_x.^2+u_y.^2;
B=sqrt(A);
REG=sum(B,'all');
DerREG = -( (u_xx.*u_y.^2 - u_x.*u_y.*u_xy - u_x.*u_y.*u_yx + u_yy.*u_x.^2) ...
        ./(0.001+ (u_x.^2 + u_y.^2).^(3/2)) );

end