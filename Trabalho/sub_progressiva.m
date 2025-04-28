function x=sub_progressiva(L,b) 

% L: matriz triangular inferior 
% b: termo independente 
% x: vetor solucao 

n=length(b); 
x=zeros(n,1); 

for i=1:n 
x(i)=(b(i)-L(i,1:i-1)*x(1:i-1))/L(i,i); 
end
