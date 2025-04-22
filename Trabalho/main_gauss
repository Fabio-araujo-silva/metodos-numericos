% Solução por Gauss-Seidel
x_gs = zeros(n, 1);   % inicializa solução
tic;
for k = 1:max_iter
    x_old = x_gs;     % guarda vetor da iteração anterior
    for i = 1:n
        neigh = neighbors(G_maior, i);
        soma = 0;
        for j = 1:length(neigh)
            j_idx = neigh(j);
            % Se o vizinho tem índice menor que i, já foi atualizado nesta iteração:
            if j_idx < i
                soma = soma + x_gs(j_idx);
            else
                soma = soma + x_old(j_idx);
            end
        end
        x_gs(i) = (Pb(i) + soma) / (L(i,i) + diagonal_P(i));
    end
    % Verifica convergência
    r = (L + P) * x_gs - Pb;
    if norm(r) / norm(Pb) < tol
        break;
    end
end
tempo_gs = toc;
iter_gs = k;
residual_gs = norm(r);
fprintf('Gauss-Seidel convergiu em %d iterações (%.4f s)\n', iter_gs, tempo_gs);

