function H=chol_decomp(A)
% A: matriz SPD
% H: triang. inferior, tal que A = H*H'
n=size(A,1);
H=tril(A);
for k=1:n-1
H(k,k)=sqrt(H(k,k));
H(k+1:n,k)=H(k+1:n,k)/H(k,k);
for j=k+1:n
H(j:n,j)=H(j:n,j)-H(j:n,k)*H(j,k);
end
end
H(n,n)=sqrt(H(n,n));
