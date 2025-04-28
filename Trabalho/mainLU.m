% Inteligando as arestas e cooordenadas do grafo
% O comando Load é utilizado para ler dados numericos simples por isso a escolha 

coordenadas = load('manh.xy');

arestas = load('manh.el');

% Como o arquivo começa no 0 e o matlab em 1 isso é para evitar problemas

arestas = arestas + 1;

%Criando o Grafo 

G = graph(arestas(:,1), arestas(:,2));

% Gera uma matriz de adjacência para que possa ser feita a função das
% componentes sem problemas
nv = 8837; % Esse valor é o tota de vértices do grafo
A = adjacency(G);
A = full(A);

% Chamando a função que encontra a maior componente conexa do grafo

[nc, nvc, vc] = Split_Edges(nv, A);

% Após o resultado da função Split_Edges vamos utilizar somente a maior
% componente

% Verificando a maior componente
[~, maior_componente] = max(nvc(:));
nos_maior = vc(maior_componente, 1:nvc(maior_componente));
G_maior = subgraph(G, nos_maior);

% Declarando essa variavel  que é o tamanho total de vértices da maior
% componente conexa para 
% ações futuras

   n = 8708;

% Adicionando valores em alguns vertices dos grafos 
% teste com 10 valores

valores_definidos = [01, 01, 03, 10, 03, 04, 03, 04, 06, 03];

% atribuidos aos indices

indices = [4949, 2741, 210, 2756, 8610, 8119, 3424, 5055, 6634, 1696];

% Isso serve para que os valores_definidos e indices_vetores sejam iguais
% em dimensões
% Isso pode ser retirado se a dimensões dos dois forem iguais

valores_definidos_vetores = valores_definidos(:);
indices_vetores = indices(:);                     

% Inicializando o vetor geral de valores
valores = zeros(8837,1);

% atribui os valores

valores(indices_vetores) = valores_definidos_vetores;

% Passando esses valores para o maior subgrafo

valores_maior = valores(nos_maior); 
G_maior.Nodes.Valor = valores_maior; 

% Construindo a matriz Laplaciana

L = laplacian(G_maior);

% Valor de penalidade 

alpha = 1.0e7;

%  Inicializa vetor diagonal 
% Esse valor 8708 ele é o valor de vértices da maior componente conexa 

diagonal_P = zeros(8708,1);

% atribui a penalidade nos índices escolhidos

diagonal_P(indices) = alpha;

% Constroi matriz diagonal esparsa


p = spdiags(diagonal_P, 0, n, n);

% Criação do vetor b

% Como é necessário ter um valor associado a cada vertice escolhido
% Será gerado de maneira aleatória e fixado e os valores serão entre o
% intervalo ((1, 10]) que no caso já são os valores_definidos

b = zeros(n,1);

b(indices) = valores_definidos_vetores;
size(b);

% Decomposição em LU

% Depedendo do resultado talvez eu possa otimiza- la para ser mais rápido
% estou utilizando a que foi apresentada em aula.

% Lado direito da expressão (P * b):

Lado_direito = p * b;

% Matriz modificada
A_mod = L + p;

% Começa a contar o tempo de solução

tic;

% Utilizando função de decomposição LU sem pivotamento
[L1, U1] = lu_decomp(full(A_mod));

% Resolve o sistema (LU)x = Pb usando substituições diretas

y = sub_progressiva(L1, Lado_direito);  
x = sub_regressiva(U1, y);  

% Encerra o cronômetro interno e guarda o valor

tempo_total = toc;

disp(x);

fprintf('Tempo total(decomposição + solução): %.6f segundos\n', tempo_total);
