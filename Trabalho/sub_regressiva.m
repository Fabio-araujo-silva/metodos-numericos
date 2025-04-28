function x=sub_regressiva(U,y) 

% U: matriz triangular superior 
% y: termo independente 
% x: vetor solucao 

n=length(y); x=zeros(n,1); 

for i=n:-1:1
 x(i)=(y(i)-U(i,i+1:n)*x(i+1:n))/U(i,i); 
end
