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

% Gráfico apenas da maior componente conexa

% Adicionando valores em alguns vertices dos grafos 
% teste com 400 vertices com valores aleatórios

valores_definidos = [07,08,04,07,03,08,06,10,05,05
05,10,10,09,03,05,01,02,10,04
10,08,06,08,10,03,02,07,06,04
05,10,02,01,07,06,03,06,04,09
01,09,10,04,04,04,06,08,03,09
08,04,10,05,10,02,04,06,06,08
09,04,07,01,08,02,09,01,01,08
10,04,10,07,02,06,06,07,07,03
08,09,01,10,10,05,01,02,03,08
04,05,04,09,10,04,02,08,02,04
09,10,07,04,04,09,02,02,06,09
08,07,06,06,07,06,01,05,02,02
08,10,10,01,04,06,10,07,10,03
01,08,04,08,08,03,02,03,01,08
01,08,09,10,02,04,05,01,09,04
05,08,10,07,06,06,07,02,02,06
10,05,03,06,09,10,07,04,08,06
06,07,06,04,08,02,05,05,09,08
10,03,04,07,09,07,04,05,09,01
04,06,09,10,08,10,09,06,08,10
04,06,04,10,10,09,09,08,02,06
08,03,01,08,02,09,07,06,10,07
09,08,03,09,04,10,10,05,02,04
07,03,03,03,03,06,02,03,05,03
06,05,09,02,03,04,01,07,03,06
06,05,03,06,06,06,08,04,04,01
05,06,10,01,05,10,05,04,07,08
06,02,10,05,06,05,02,07,08,09
01,02,04,09,06,03,08,05,06,07
02,10,10,05,10,03,03,07,02,03
09,03,01,08,08,08,02,01,02,02
02,09,08,01,06,10,06,07,06,06
04,03,09,08,07,07,06,08,08,05
09,03,10,09,10,04,09,01,04,07
08,05,09,10,10,03,05,08,02,04
06,05,05,09,05,02,07,09,02,08
07,08,06,07,06,07,08,10,04,10
06,01,10,10,03,02,09,10,07,07
08,07,10,10,08,06,09,01,09,09
07,02,10,07,06,03,09,03,07,02];

% Também foram gerados 400 vértices de forma aleatoria

indices = [1716,0417,2069,1016,4577,1192,4650,2488,3411,6210
1636,7160,0823,1942,2810,4201,7096,5842,5160,2321
5703,4110,1167,2510,6667,3674,6917,7702,1387,4363
1234,5699,6264,8246,0569,4691,5059,4451,4603,4512
0366,4222,4222,7554,5867,8484,7679,5849,8115,3067
2673,7015,2663,5581,0040,4980,2014,3349,1731,3265
4372,4187,6639,2314,1469,1532,0209,8138,3317,2521
3924,6392,2924,4410,7165,6552,1852,4209,3903,8052
5911,3722,2894,3654,8184,2517,5452,1632,5607,2537
2168,8217,1926,0372,1486,1792,4764,8515,3058,2657
0804,4906,4456,8605,4419,2379,2936,5024,6095,1356
2217,0994,7941,4057,0668,0019,8568,8184,0978,7264
0701,6824,5597,4292,4976,3843,4128,7705,7674,5435
8369,3568,0898,7643,5131,1481,8358,0509,6559,4465
2185,5013,7369,0766,8398,4467,8358,8204,1539,8636
0795,1815,8214,3065,3265,0360,1233,1326,7409,2199
1047,7770,8663,5041,2725,6606,0455,7608,0527,3811
1782,1947,7628,3719,7506,8452,1798,1521,5724,2758
1569,6612,3456,3294,4804,4817,3160,2400,0310,1437
7056,2354,3105,7662,6666,4931,8517,6498,2782,7593
8437,7476,1310,4216,2975,1404,8041,1936,2309,4624
3187,5908,4917,5276,7090,1929,0488,6122,7468,8411
2731,4989,4471,5052,1562,7613,6184,4585,4878,2403
5500,0630,6509,3378,1090,3749,2471,2631,6689,6624
0861,2082,2751,5756,6182,1099,3296,8269,2769,6197
3541,3793,7208,5527,5658,7308,4435,1888,3994,6334
3519,1894,3960,3866,2737,4636,2469,7512,7061,4184
0950,0798,7850,5436,7533,5247,4950,5950,1871,6194
3552,8474,8175,6058,5237,7979,7556,8063,3565,0831
3671,3960,5471,0184,3851,2766,0905,2195,5182,2614
1571,1520,3915,8558,3808,7829,2854,4318,6094,2729
4744,5895,7224,6113,1838,4319,5060,3605,7821,5732
0790,2964,8479,4075,0348,0339,2761,2572,0197,5645
1626,4095,0587,1222,7360,3392,0259,4089,7340,7778
3863,4795,6053,8160,2061,6896,5900,5447,5357,4806
1202,7702,1656,3656,7176,2462,7877,8310,2155,2253
7406,6430,2451,4091,5308,0640,4348,3437,2217,2996
5941,2640,5981,1535,5555,2758,1348,0088,6781,2839
5037,3020,1522,6796,6179,8223,7042,2290,7021,1190
3745,2045,5625,6185,8485,2869,1612,1615,5802,7530];

% Isso serve para que os valores_definidos e indices_vetores sejam iguais
% em dimensões
% Isso pode ser retirado se a dimensões dod dois forem iguais

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
% 8708 é o valor de vértices da maior componente conexa 

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

tic;

% Método dos Gradientes Conjugados para resolver (L + P)x = Pb

x = zeros(n,1);                     % chute inicial v0
r = Lado_direito - A_mod * x;       % r0 = b - Ax
d = r;                              % direção inicial
erro = 1e-6;
kmax = 2 * n;

for k = 1:kmax
    Ad = A_mod * d;
    alpha = (r' * r) / (d' * Ad);
    x = x + alpha * d;
    r_new = r - alpha * Ad;

    if norm(r_new) < erro
        fprintf('Convergência em %d iterações\n', k);
        break;
    end

    beta = (r_new' * r_new) / (r' * r);
    d = r_new + beta * d;
    r = r_new;
end

% Fim do CG

tempo_total = toc;

disp(x);

fprintf('convergiu com %d iterações e em %.6f segundos\n', k, tempo_total);

y = (L + p) \ p*b;

disp(y);

check_approximation(x, y)
