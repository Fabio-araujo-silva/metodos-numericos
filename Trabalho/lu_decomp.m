function [L,U]=lu_decomp(A)
% A: matriz quadrada
% L, U: matrizes triang. inf. e sup., respectivamente.
n=size(A,1); L=eye(n); U=zeros(n);
for k=1:n
    for j=k:n
        U(k,j)=A(k,j);
        for s=1:k-1
            U(k,j)=U(k,j)-L(k,s)*U(s,j);
        end
    end
    for i=k+1:n
        L(i,k)=A(i,k);
        for s=1:k-1
            L(i,k)=L(i,k)-L(i,s)*U(s,k);
        end
         L(i,k)=L(i,k)/U(k,k);
    end
end