% Carregamento de dados fornecidos
coordenadas = load('manh.xy');
arestas = load('manh.el');

% Ajuste de índices
arestas = arestas + 1;

% Criação do grafo 
G = graph(arestas(:,1), arestas(:,2));

% Criação da matriz de adjascência
nv = numnodes(G); 
A = adjacency(G);
A = full(A);

% Maior componente conexa do grafo, encontrada pela função fornecida
[nc, nvc, vc] = Split_Edges(nv, A);

[~, maior_componente] = max(nvc(:));
nos_maior = vc(maior_componente, 1:nvc(maior_componente));
G_maior = subgraph(G, nos_maior);

n = numnodes(G_maior);

% teste com 10 valores

valores_definidos = [01, 01, 03, 10, 03, 04, 03, 04, 06, 03];

% atribuidos aos indices

indices = [4949, 2741, 210, 2756, 8610, 8119, 3424, 5055, 6634, 1696];

% Igualando as dimensões
valores_definidos_vetores = valores_definidos(:);
indices_vetores = indices(:);                     

% Inicializando o vetor geral de valores
valores = zeros(nv,1);

% Atribuição dos valores
valores(indices_vetores) = valores_definidos_vetores;

valores_maior = valores(nos_maior); 
G_maior.Nodes.Valor = valores_maior; 

% Construção da matriz Laplaciana
L = laplacian(G_maior);

% Valor de penalidade 
alpha = 1.0e7;

%  Inicializa vetor diagonal 
diagonal_P = zeros(n,1);

% Atribuição da penalidade
diagonal_P(indices) = alpha;

% Construção da matriz diagonal esparsa
p = spdiags(diagonal_P, 0, n, n);

% Criação do vetor b
b = zeros(n,1);

b(indices) = valores_definidos_vetores;
size(b);

% Lado direito da expressão (P * b):
Lado_direito = p * b;

% Matriz modificada
A_mod = L + p;

% Utilizando função de decomposição Cholesky

tic;

G = chol_decomp(full(A_mod));        % Decomposição de Cholesky

y = sub_progressiva(G, Lado_direito);  % Resolve G * y = b
x = sub_regressiva(G', y);             % Resolve G' * x = y

tempo_total = toc;

%Exibição do vetor solução
disp(x);

%Exibição do tempo total
fprintf('Tempo total(decomposição + solução): %.6f segundos\n', tempo_total);
