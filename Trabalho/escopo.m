% Inteligando as arestas e cooordenadas do grafo
% O comando Load é utilizado para ler dados numericos simples por isso a escolha 

coordenadas = load('manh.xy');

arestas = load('manh.el');

% Como o arquivo começa no 0 e o matlab em 1 isso é para evitar problemas

arestas = arestas + 1;

%Criando o Grafo 

G = graph(arestas(:,1), arestas(:,2));

% Esse comandos são para visualizar o Gráfico
%figure;

%plot(G,'XData', coordenadas(:,1), 'YData', coordenadas(:,2),'NodeLabel', 1:numnodes(G));

%title('Grafo de Manhattan');

% Gera uma matriz de adjacência para que possa ser feita a função das
% componentes sem problemas
nv = numnodes(G);
A = adjacency(G);
A = full(A);

% Chamando a função que encontra a maior componente conexa do grafo

[nc, nvc, vc] = Split_Edges(nv, A);

%Esses comandos são para visualizar o gráfico
%colors = lines(nc); 

%figure;
%hold on;
%p = plot(G, 'XData', coordenadas(:,1), 'YData', coordenadas(:,2));
%for i = 1:nc
    %highlight(p, vc(i,1:nvc(i)), 'NodeColor', colors(i,:), 'MarkerSize', 6);
%end
%title('Componentes Conexos no Grafo de Manhattan');

% Após o resultado da função Split_Edges vamos utilizar somente a maior
% componente

% Verificando a maior componente
[~, idx_maior] = max(nvc);
nos_maior = vc(idx_maior, 1:nvc(idx_maior));

G_maior = subgraph(G, nos_maior);

% Gráfico apenas da maior componente conexa
%figure;
%plot(G_maior, ...
     %'XData', coordenadas(nos_maior,1), ...
     %'YData', coordenadas(nos_maior,2), ...
     %'NodeLabel', {});
%title('Maior Componente Conexa do Grafo de Manhattan');

% Adicionando valores em alguns vertices dos grafos 














