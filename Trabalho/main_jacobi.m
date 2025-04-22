% Solução por Jacobi
max_iter = 10000;
tol = 1e-6;
x_jacobi = zeros(n, 1);          % x^(old), inicializado com zeros
x_new = zeros(n, 1);             % para armazenar x^(new)

tic;  % inicia contagem de tempo
for k = 1:max_iter
    % Iteração Jacobi: calcula x_new usando x_jacobi (valores antigos)
    for i = 1:n
        % soma dos vizinhos de i (usando grafo para evitar varrer toda matriz)
        neigh = neighbors(G_maior, i);   % lista de vizinhos do vértice i
        soma = 0;
        for j = 1:length(neigh)
            j_idx = neigh(j);
            soma = soma + x_jacobi(j_idx);
        end
        % Atualização de Jacobi para o i-ésimo elemento
        x_new(i) = (Pb(i) + soma) / (L(i,i) + diagonal_P(i));
        % Nota: L(i,i) = grau(i), diagonal_P(i) é alpha se penalizado ou 0 se não.
    end
    % Verifica critério de convergência (erro residual relativo)
    r = (L + P) * x_new - Pb;                   % residual r = A*x_new - Pb
    if norm(r) / norm(Pb) < tol
        break;
    end
    x_jacobi = x_new;   % prepara para próxima iteração
end
tempo_jacobi = toc;
iter_jacobi = k;
residual_jacobi = norm(r);
fprintf('Jacobi convergiu em %d iterações (%.4f s)\n', iter_jacobi, tempo_jacobi);
