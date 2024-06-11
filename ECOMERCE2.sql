/*Integrantes do grupo*/

/*AUGUSTO HENRIQUE PERNA
  FERNANDO PEREZ BORIN
  MARCUS PAULO DIB LOPES
  MATEUS GUIDELLI CABRAL DA SILVA
  VINÍCIUS VICARI*/

/*Artefato 1*/

/*Declaração das tabelas de dados*/
CREATE TABLE t_clientes (

  id_cliente    INT NOT NULL PRIMARY KEY,
  nome          VARCHAR2(255),
  documentacao  VARCHAR2(20),
  endereco      VARCHAR2(255),
  cartao        VARCHAR2(20) 
  
);

CREATE TABLE t_maquinario (

   id_maquinario         INT NOT NULL PRIMARY KEY,
   nome                  VARCHAR2(255),
   tipo_maquina          VARCHAR2(255),
   certificado_validacao VARCHAR2(100),
   historico_reparo      VARCHAR2(255),
   calibracao            VARCHAR2(100)

);

CREATE TABLE t_produtos (

  id_produtos    INT NOT NULL PRIMARY KEY,
  tipo           VARCHAR2(255),
  marca          VARCHAR2(255),
  produto        VARCHAR2(255),
  cor            VARCHAR2(50),
  voltagem       VARCHAR2(50),
  cod_fabricante VARCHAR2(100),
  preco          FLOAT

);

CREATE TABLE t_pedidos (

  id_pedido    INT NOT NULL PRIMARY KEY,
  id_cliente   INT,
  id_produto   INT,
  data_entrada DATE,
  data_saida   DATE,
  data_chegada DATE,
  preco_frete  FLOAT,
  FOREIGN KEY  (id_cliente)  REFERENCES t_clientes(id_cliente),
  FOREIGN KEY  (id_produto) REFERENCES t_produtos(id_produtos)

); 

CREATE TABLE t_promocao (

  id_promocao  INT NOT NULL PRIMARY KEY,
  id_produto   INT,
  data_inicio  DATE,
  data_termino DATE, 
  FOREIGN KEY  (id_produto) REFERENCES t_produtos(id_produtos)

);

CREATE TABLE t_imagens(

id_imagem       INT NOT NULL PRIMARY KEY,
id_produto      INT,
caminho         VARCHAR(90),
legenda         VARCHAR(75),
tipo            VARCHAR(30), 
FOREIGN KEY     (id_produto) REFERENCES t_produtos(id_produtos)

);

CREATE TABLE t_estoque(

id_estoque          INT NOT NULL PRIMARY KEY,
id_produto          INT,
quantidade          INT,
data_atualizacao    DATE,
local_estoque       VARCHAR(80),
FOREIGN KEY         (id_produto) REFERENCES t_produtos(id_produtos)

);

CREATE TABLE t_carrinho_compras(

id_carrinho              INT NOT NULL PRIMARY KEY,
id_cliente               INT,
data_criacao             DATE,
data_ult_atualizacao     DATE,
status                   VARCHAR(30),
FOREIGN KEY (id_cliente) REFERENCES t_clientes(id_cliente)

);

CREATE TABLE t_itens_carrinho(

item_id         INT NOT NULL PRIMARY   KEY,
id_carrinho     INT,
id_cliente      INT,
id_produto      INT,
quantidade      INT,
preco_unitario  FLOAT,
FOREIGN KEY     (id_carrinho) REFERENCES t_carrinho_compras(id_carrinho),
FOREIGN KEY     (id_produto)  REFERENCES t_produtos(id_produtos),
FOREIGN KEY     (id_cliente)  REFERENCES t_clientes(id_cliente)
    
);

CREATE TABLE t_endereco_entrega(

id_endereco     INT PRIMARY KEY,
id_cliente      INT,
cep             VARCHAR2(9),
logradouro      VARCHAR2(10), /*O logradouro será tratado segundo código*/
numero          INT,
complemento     VARCHAR2(30),
bairro          VARCHAR2(255),
cidade          VARCHAR2(40),
estado          VARCHAR2(40),
FOREIGN KEY     (id_cliente) REFERENCES t_clientes(id_cliente)

);

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Populando as tabelas*/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*Populando a tabela clientes*/
INSERT INTO t_clientes (id_cliente, nome, documentacao, endereco, cartao) VALUES
(1,  'Moacir', '512030098-7', 'Santo Antônio do Descoberto', 'credito');
INSERT INTO t_clientes (id_cliente, nome, documentacao, endereco, cartao) VALUES
(2,  'Mauricio', '512030098-8',  'Rua Marinho Rangel Vieira', 'credito');
INSERT INTO t_clientes (id_cliente, nome, documentacao, endereco, cartao) VALUES
(3,  'Marcus', '512030038-8',  'Rua Nova Brasília', 'credito');
INSERT INTO t_clientes (id_cliente, nome, documentacao, endereco, cartao) VALUES
(4,  'TechnoBlade', '512030038-21', 'Rua da Árvore', 'credito');
INSERT INTO t_clientes (id_cliente, nome, documentacao, endereco, cartao) VALUES
(5,  'o7', '512031038-21', 'Rua Soldado-Polícia Militar Jacinto José de Santana da Silva', 'credito');
INSERT INTO t_clientes (id_cliente, nome, documentacao, endereco, cartao) VALUES
(6,  'Guilherme', '512031038-21', 'Rua Vera Cruz', 'credito');
INSERT INTO t_clientes (id_cliente, nome, documentacao, endereco, cartao) VALUES
(7,  'Alexandre', '271031038-21', 'Setor de Habitações Individuais Sul', 'credito');
INSERT INTO t_clientes (id_cliente, nome, documentacao, endereco, cartao) VALUES
(8,  'Alexa', '271041038-21', 'Rua nova', 'credito');
INSERT INTO t_clientes (id_cliente, nome, documentacao, endereco, cartao) VALUES
(9,  'Silvano', '61349449',     'Rua Durandir', 'Debito');
INSERT INTO t_clientes (id_cliente, nome, documentacao, endereco, cartao) VALUES
(10, 'Dream', '61349777',     'SMP', 'Credito');
INSERT INTO t_clientes (id_cliente, nome, documentacao, endereco, cartao) VALUES
(11, 'Philza', '821455897-92', 'Apecida do norte', 'Credito');

/*Populando a tabela maquinario*/
INSERT INTO t_maquinario (id_maquinario, nome, tipo_maquina, certificado_validacao, historico_reparo, calibracao) VALUES
(1, 'Caixa Eletronico', '', '', '', 'CTR - 008 ');
INSERT INTO t_maquinario (id_maquinario, nome, tipo_maquina, certificado_validacao, historico_reparo, calibracao) VALUES
(2, 'Caixa Eletronico', 'Cadastro', 'OBT-24', '14/05/2024', 'CTR - 008 ');
INSERT INTO t_maquinario (id_maquinario, nome, tipo_maquina, certificado_validacao, historico_reparo, calibracao) VALUES
(3, 'Caixa Eletronico', 'Cadastro', 'OBT-26', '14/05/2024', 'CTR - 010');
INSERT INTO t_maquinario (id_maquinario, nome, tipo_maquina, certificado_validacao, historico_reparo, calibracao) VALUES
(4, 'Caixa Eletronico', 'Cadastro', 'OBT-27', '14/05/2024', 'CTR - 011');
INSERT INTO t_maquinario (id_maquinario, nome, tipo_maquina, certificado_validacao, historico_reparo, calibracao) VALUES
(5, 'Caixa Eletronico', 'Cadastro', 'OBT-28', '14/05/2024', 'CTR - 012');
INSERT INTO t_maquinario (id_maquinario, nome, tipo_maquina, certificado_validacao, historico_reparo, calibracao) VALUES
(6, 'Caixa Eletronico', 'Cadastro', 'OBT-29', '14/05/2024', 'CTR - 013');
INSERT INTO t_maquinario (id_maquinario, nome, tipo_maquina, certificado_validacao, historico_reparo, calibracao) VALUES
(7, 'Computador', 'Cadastro', 'Win-10', '14/05/2024', 'PASS - 071');
INSERT INTO t_maquinario (id_maquinario, nome, tipo_maquina, certificado_validacao, historico_reparo, calibracao) VALUES
(8, 'Computador', 'Cadastro', 'Win-10', '14/05/2024', 'PASS - 072');
INSERT INTO t_maquinario (id_maquinario, nome, tipo_maquina, certificado_validacao, historico_reparo, calibracao) VALUES
(9, 'Computador', 'Cadastro', 'Win-10', '14/05/2024', 'PASS - 073');
INSERT INTO t_maquinario (id_maquinario, nome, tipo_maquina, certificado_validacao, historico_reparo, calibracao) VALUES
(10, 'Computador', 'Cadastro', 'Win-10', '14/05/2024', 'PASS - 074');
INSERT INTO t_maquinario (id_maquinario, nome, tipo_maquina, certificado_validacao, historico_reparo, calibracao) VALUES
(11, 'Computador', 'Cadastro', 'Win-10', '14/05/2024', 'PASS - 075');
INSERT INTO t_maquinario (id_maquinario, nome, tipo_maquina, certificado_validacao, historico_reparo, calibracao) VALUES
(12, 'Registradora ', 'Caixa', 'RCC-721', '--', 'CRT-008');
INSERT INTO t_maquinario (id_maquinario, nome, tipo_maquina, certificado_validacao, historico_reparo, calibracao) VALUES
(13, 'Registradora ', 'Caixa', 'RCC-722', '--', 'CRT-008');
INSERT INTO t_maquinario (id_maquinario, nome, tipo_maquina, certificado_validacao, historico_reparo, calibracao) VALUES
(14, 'Registradora ', 'Caixa', 'RCC-723', '--', 'CRT-008');
INSERT INTO t_maquinario (id_maquinario, nome, tipo_maquina, certificado_validacao, historico_reparo, calibracao) VALUES
(15, 'Registradora ', 'Caixa', 'RCC-724', '--', 'CRT-008');

/*Populando a tabela de produtos*/
INSERT INTO t_produtos (id_produtos, tipo, marca, produto, cor, voltagem, cod_fabricante, preco) VALUES
(1, 'Eletrodomestico', 'Regulus', 'geladeira', 'Branco - Dourado', '1', '0712', 300.00);
INSERT INTO t_produtos (id_produtos, tipo, marca, produto, cor, voltagem, cod_fabricante, preco) VALUES
(2, 'Eletrodomestico', 'Regulus', 'Máquina de lavar', 'Branco - Dourado', '1', '0712', 300.00);
INSERT INTO t_produtos (id_produtos, tipo, marca, produto, cor, voltagem, cod_fabricante, preco) VALUES
(3, 'Eletrodomestico', 'Libra ', 'Liquidificador', 'Branco - Dourado', '1', '0808', 450.00);
INSERT INTO t_produtos (id_produtos, tipo, marca, produto, cor, voltagem, cod_fabricante, preco) VALUES
(4, 'Eletrodomestico', 'Libra ', 'Batedeira', 'Branco - Dourado', '1', '8080', 450.00);
INSERT INTO t_produtos (id_produtos, tipo, marca, produto, cor, voltagem, cod_fabricante, preco) VALUES
(5, 'Eletrodomestico', 'Libra ', 'Forno Elétrico', 'Amarelo ouro', '1', '8080', 450.00);
INSERT INTO t_produtos (id_produtos, tipo, marca, produto, cor, voltagem, cod_fabricante, preco) VALUES
(6, 'Eletrodomestico', 'Libra ', 'Ventilador', 'Amarelo ouro', '2', '8080', 450.00);
INSERT INTO t_produtos (id_produtos, tipo, marca, produto, cor, voltagem, cod_fabricante, preco) VALUES
(7, 'Eletrodomestico', 'Libra ', 'Sanduicheira ', 'vermelho', '2', '8080', 300.00);
INSERT INTO t_produtos (id_produtos, tipo, marca, produto, cor, voltagem, cod_fabricante, preco) VALUES
(8, 'Eletrodomestico', 'Libra ', 'Espremedor de frutas', 'Azul', '2', '8080', 300.00);
INSERT INTO t_produtos (id_produtos, tipo, marca, produto, cor, voltagem, cod_fabricante, preco) VALUES
(9, 'Utilite', 'Libra ', 'Aspirador ', 'Azul', '1', '8080', 300.00);
INSERT INTO t_produtos (id_produtos, tipo, marca, produto, cor, voltagem, cod_fabricante, preco) VALUES
(10, 'Utilite', 'Marionetta', 'Orb do futuro ', 'Mistico ', '3', '1192', 600.00);
INSERT INTO t_produtos (id_produtos, tipo, marca, produto, cor, voltagem, cod_fabricante, preco) VALUES
(11, 'Utilite', 'Marionetta', 'Jogo de facas ', 'Mistico ', '3', '1192', 250.00);
INSERT INTO t_produtos (id_produtos, tipo, marca, produto, cor, voltagem, cod_fabricante, preco) VALUES
(12, 'Utilite', 'Marionetta', 'Lua de Eclipse ', 'Mistico ', '3', '1192', 1500.00);

/*Populando a tabela de pedidos*/
INSERT INTO t_pedidos (id_pedido, id_cliente, id_produto, data_entrada, data_saida, data_chegada, preco_frete) VALUES
(1, 1, 2, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 50.00);
INSERT INTO t_pedidos (id_pedido, id_cliente, id_produto, data_entrada, data_saida, data_chegada, preco_frete) VALUES
(2, 2, 3, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 20.00);
INSERT INTO t_pedidos (id_pedido, id_cliente, id_produto, data_entrada, data_saida, data_chegada, preco_frete) VALUES
(3, 2, 1, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 20.00);
INSERT INTO t_pedidos (id_pedido, id_cliente, id_produto, data_entrada, data_saida, data_chegada, preco_frete) VALUES
(4, 2, 8, TO_DATE('25/05/2024', 'DD/MM/YYYY'),TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 20.00);
INSERT INTO t_pedidos (id_pedido, id_cliente, id_produto, data_entrada, data_saida, data_chegada, preco_frete) VALUES
(5, 3, 8, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 20.00);
INSERT INTO t_pedidos (id_pedido, id_cliente, id_produto, data_entrada, data_saida, data_chegada, preco_frete) VALUES
(6, 3, 4, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 20.00);
INSERT INTO t_pedidos (id_pedido, id_cliente, id_produto, data_entrada, data_saida, data_chegada, preco_frete) VALUES
(7, 3, 10, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 20.00);
INSERT INTO t_pedidos (id_pedido, id_cliente, id_produto, data_entrada, data_saida, data_chegada, preco_frete) VALUES
(8, 4, 10, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 20.00);
INSERT INTO t_pedidos (id_pedido, id_cliente, id_produto, data_entrada, data_saida, data_chegada, preco_frete) VALUES
(9, 4, 11, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 20.00);
INSERT INTO t_pedidos (id_pedido, id_cliente, id_produto, data_entrada, data_saida, data_chegada, preco_frete) VALUES
(10, 4, 7, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 20.00);
INSERT INTO t_pedidos (id_pedido, id_cliente, id_produto, data_entrada, data_saida, data_chegada, preco_frete) VALUES
(11, 5, 7, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 25.00);
INSERT INTO t_pedidos (id_pedido, id_cliente, id_produto, data_entrada, data_saida, data_chegada, preco_frete) VALUES
(12, 5, 4, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 25.00);

/*Populando a tabela de promoções*/
INSERT INTO t_promocao (id_promocao, id_produto, data_inicio, data_termino) VALUES
(1, 11, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'));
INSERT INTO t_promocao (id_promocao, id_produto, data_inicio, data_termino) VALUES
(2, 1, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'));
INSERT INTO t_promocao (id_promocao, id_produto, data_inicio, data_termino) VALUES
(3, 3, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'));
INSERT INTO t_promocao (id_promocao, id_produto, data_inicio, data_termino) VALUES
(4, 2, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'));
INSERT INTO t_promocao (id_promocao, id_produto, data_inicio, data_termino) VALUES
(5, 7, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'));
INSERT INTO t_promocao (id_promocao, id_produto, data_inicio, data_termino) VALUES
(6, 5, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'));
INSERT INTO t_promocao (id_promocao, id_produto, data_inicio, data_termino) VALUES
(7, 2, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'));

/*Populando a tabela de imagens*/
INSERT INTO t_imagens(id_imagem, id_produto, caminho, legenda, tipo)VALUES
(1, 1, 'C:\Users\Imagens\Geladeira', 'imagens de geladeira', 'principal');
INSERT INTO t_imagens(id_imagem, id_produto, caminho, legenda, tipo)VALUES
(2, 2, 'C:\Users\Imagens\Máquina de lavar', 'imagens de máquina de lavar', 'principal');
INSERT INTO t_imagens(id_imagem, id_produto, caminho, legenda, tipo)VALUES
(3, 3, 'C:\Users\Imagens\Liquidificador', 'imagens de liquidificador', 'principal');
INSERT INTO t_imagens(id_imagem, id_produto, caminho, legenda, tipo)VALUES
(4, 4, 'C:\Users\Imagens\Batedeira', 'imagens de batedeira', 'principal');
INSERT INTO t_imagens(id_imagem, id_produto, caminho, legenda, tipo)VALUES
(5, 5, 'C:\Users\Imagens\Forno Elétrico', 'imagens de forno elétrico', 'principal');
INSERT INTO t_imagens(id_imagem, id_produto, caminho, legenda, tipo)VALUES
(6, 6, 'C:\Users\Imagens\Ventilador', 'imagens de ventilador', 'principal');
INSERT INTO t_imagens(id_imagem, id_produto, caminho, legenda, tipo)VALUES
(7, 7, 'C:\Users\Imagens\Sanduicheira', 'imagens de sanduicheira', 'principal');
INSERT INTO t_imagens(id_imagem, id_produto, caminho, legenda, tipo)VALUES
(8, 8, 'C:\Users\Imagens\Espremedor de frutas', 'imagens de espremedor de frutas', 'principal');
INSERT INTO t_imagens(id_imagem, id_produto, caminho, legenda, tipo)VALUES
(9, 9, 'C:\Users\Imagens\Aspirador', 'imagens de Aspirador', 'principal');
INSERT INTO t_imagens(id_imagem, id_produto, caminho, legenda, tipo)VALUES
(10, 10, 'C:\Users\Imagens\Espremedor de frutas', 'imagens de espremedor de frutas', 'principal');
INSERT INTO t_imagens(id_imagem, id_produto, caminho, legenda, tipo)VALUES
(11, 11, 'C:\Users\Imagens\Orb do futuro', 'imagens de Orb do futuro', 'principal');
INSERT INTO t_imagens(id_imagem, id_produto, caminho, legenda, tipo)VALUES
(12, 12, 'C:\Users\Imagens\Lua de Eclipse', 'imagens de Lua de Eclipse', 'principal');

/*Populando tabela de estoque*/
INSERT INTO t_estoque(id_estoque, id_produto, quantidade, data_atualizacao, local_estoque)VALUES
(1, 1, 236, TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Ribeirão Preto');
INSERT INTO t_estoque(id_estoque, id_produto, quantidade, data_atualizacao, local_estoque)VALUES
(2, 2, 236, TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Cravinhos');
INSERT INTO t_estoque(id_estoque, id_produto, quantidade, data_atualizacao, local_estoque)VALUES
(3, 3, 236, TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Sertãozinho');
INSERT INTO t_estoque(id_estoque, id_produto, quantidade, data_atualizacao, local_estoque)VALUES
(4, 4, 236, TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Serrana');
INSERT INTO t_estoque(id_estoque, id_produto, quantidade, data_atualizacao, local_estoque)VALUES
(5, 5, 236, TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Jardinópolis');
INSERT INTO t_estoque(id_estoque, id_produto, quantidade, data_atualizacao, local_estoque)VALUES
(6, 6, 236, TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'São Carlos');
INSERT INTO t_estoque(id_estoque, id_produto, quantidade, data_atualizacao, local_estoque)VALUES
(7, 7, 236, TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Barretos');
INSERT INTO t_estoque(id_estoque, id_produto, quantidade, data_atualizacao, local_estoque)VALUES
(8, 8, 236, TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Ribeirão Preto');
INSERT INTO t_estoque(id_estoque, id_produto, quantidade, data_atualizacao, local_estoque)VALUES
(9, 9, 0, TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Ribeirão Preto');
INSERT INTO t_estoque(id_estoque, id_produto, quantidade, data_atualizacao, local_estoque)VALUES
(10, 10, 0, TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Ribeirão Preto');
INSERT INTO t_estoque(id_estoque, id_produto, quantidade, data_atualizacao, local_estoque)VALUES
(11, 11, 100, TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Ribeirão Preto');
INSERT INTO t_estoque(id_estoque, id_produto, quantidade, data_atualizacao, local_estoque)VALUES
(12, 12, 0, TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Ribeirão Preto');

/*Populando tabela de carrinho de compras*/
INSERT INTO t_carrinho_compras(id_carrinho, id_cliente, data_criacao, data_ult_atualizacao, status)VALUES
(1, 1, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Encaminhado');
INSERT INTO t_carrinho_compras(id_carrinho, id_cliente, data_criacao, data_ult_atualizacao, status)VALUES
(2, 2, TO_DATE('20/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Finalizado');
INSERT INTO t_carrinho_compras(id_carrinho, id_cliente, data_criacao, data_ult_atualizacao, status)VALUES
(3, 3, TO_DATE('24/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Em andamento');
INSERT INTO t_carrinho_compras(id_carrinho, id_cliente, data_criacao, data_ult_atualizacao, status)VALUES
(4, 4, TO_DATE('19/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Finalizado');
INSERT INTO t_carrinho_compras(id_carrinho, id_cliente, data_criacao, data_ult_atualizacao, status)VALUES
(5, 5, TO_DATE('25/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Encaminhado');
INSERT INTO t_carrinho_compras(id_carrinho, id_cliente, data_criacao, data_ult_atualizacao, status)VALUES
(6, 6, TO_DATE('22/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Em andamento');
INSERT INTO t_carrinho_compras(id_carrinho, id_cliente, data_criacao, data_ult_atualizacao, status)VALUES
(7, 7, TO_DATE('18/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Finalizado');
INSERT INTO t_carrinho_compras(id_carrinho, id_cliente, data_criacao, data_ult_atualizacao, status)VALUES
(8, 8, TO_DATE('15/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Em andamento');
INSERT INTO t_carrinho_compras(id_carrinho, id_cliente, data_criacao, data_ult_atualizacao, status)VALUES
(9, 9, TO_DATE('10/05/2024', 'DD/MM/YYYY'), TO_DATE('25/05/2024', 'DD/MM/YYYY'), 'Finalizado');

/*Populando tabela de itens do carrihno de compras*/
INSERT INTO t_itens_carrinho(item_id, id_carrinho, id_cliente, id_produto, quantidade, preco_unitario)VALUES
(1, 1, 5 ,5, 1, 1500.99);
INSERT INTO t_itens_carrinho(item_id, id_carrinho, id_cliente , id_produto, quantidade, preco_unitario)VALUES
(2, 2, 4 ,1, 3, 5282.97);
INSERT INTO t_itens_carrinho(item_id, id_carrinho, id_cliente ,id_produto, quantidade, preco_unitario)VALUES
(3, 3, 3, 8, 2, 421.98);
INSERT INTO t_itens_carrinho(item_id, id_carrinho, id_cliente ,id_produto, quantidade, preco_unitario)VALUES
(4, 4, 2 ,2, 1, 1560.99);
INSERT INTO t_itens_carrinho(item_id, id_carrinho, id_cliente ,id_produto, quantidade, preco_unitario)VALUES
(5, 5, 1 ,6, 1, 310.99);
INSERT INTO t_itens_carrinho(item_id, id_carrinho, id_cliente ,id_produto, quantidade, preco_unitario)VALUES
(6, 6, 7, 1, 2, 3521.98);
INSERT INTO t_itens_carrinho(item_id, id_carrinho, id_cliente ,id_produto, quantidade, preco_unitario)VALUES
(7, 7, 6 ,4, 1, 350.99);
INSERT INTO t_itens_carrinho(item_id, id_carrinho, id_cliente ,id_produto, quantidade, preco_unitario)VALUES
(8, 8, 3 ,6, 2, 621.98);

/*Populando tabela do endereço de entregas*/
INSERT INTO t_endereco_entrega(id_endereco, id_cliente, cep, logradouro, numero, complemento, bairro, cidade, estado)VALUES
(1, 1, '18708-685', 'AV', '233', 'Casa', 'Santo Antônio do Descoberto', 'Ribeirão Preto', 'SP');
INSERT INTO t_endereco_entrega(id_endereco, id_cliente, cep, logradouro, numero, complemento, bairro, cidade, estado)VALUES
(2, 2, '24325-120', 'R', '235', 'Aptmento', 'Rua Marinho Rangel Vieira', 'Rio de Janeiro', 'RJ');
INSERT INTO t_endereco_entrega(id_endereco, id_cliente, cep, logradouro, numero, complemento, bairro, cidade, estado)VALUES
(3, 3, '58406-760', 'R', '176', 'Casa', 'Rua Nova Brasília', 'Campina Grande', 'PB');
INSERT INTO t_endereco_entrega(id_endereco, id_cliente, cep, logradouro, numero, complemento, bairro, cidade, estado)VALUES
(4, 4, '29199-180', 'R', '98', 'Aptmento', 'Rua da Árvore', 'Aracruz', 'ES');
INSERT INTO t_endereco_entrega(id_endereco, id_cliente, cep, logradouro, numero, complemento, bairro, cidade, estado)VALUES
(5, 5, '69313-572', 'R', '123', 'Casa', 'Rua Soldado-Polícia Militar Jacinto José de Santana da Silva', 'Boa Vista', 'Roraima');
INSERT INTO t_endereco_entrega(id_endereco, id_cliente, cep, logradouro, numero, complemento, bairro, cidade, estado)VALUES
(6, 6, '74713-025', 'R', '345', 'Casa', 'Rua Vera Cruz', 'Goiânia', 'Goiás');
INSERT INTO t_endereco_entrega(id_endereco, id_cliente, cep, logradouro, numero, complemento, bairro, cidade, estado)VALUES
(7, 7, '71660-100', 'R', '245', 'Aptmento', 'Setor de Habitações Individuais Sul', 'Brasília', 'DF');
INSERT INTO t_endereco_entrega(id_endereco, id_cliente, cep, logradouro, numero, complemento, bairro, cidade, estado)VALUES
(8, 8, '69918-260', 'R', '546', 'Casa', 'Rua Vinte e Dois', 'Rio Branco', 'AC');

/*Artefato 2*/
/*Os enuniciados contendo as regras de cada consulta estão anexos no arquivo Consulta SQL.txt*/

/*consultaE_1*/
SELECT *
FROM t_produtos
WHERE tipo LIKE '%Eletrodomestico%'; /*Seleciona todos os eletrodomesticos*/

/*consultaE_1*/
SELECT *
FROM t_estoque
WHERE local_estoque LIKE '%Ribeirão Preto%'; /*Seleciona todos os estoques de Ribeirão Preto*/

/*consultaE_2*/
SELECT * FROM t_produtos 
WHERE marca IN ('Regulus');

/*consultaE_2*/
SELECT * FROM t_maquinario 
WHERE nome IN ('Computador ');

/*consultaE_3*/
SELECT t_promocao.*, t_produtos.id_produtos, t_produtos.marca, t_produtos.produto
FROM t_promocao
LEFT OUTER JOIN t_produtos
ON t_promocao.id_produto = t_produtos.id_produtos;

/*consultaE_3*/
SELECT t_pedidos.*, t_clientes.id_cliente
FROM t_pedidos
RIGHT OUTER JOIN t_clientes
ON t_pedidos.id_cliente = t_clientes.id_cliente
WHERE t_pedidos.id_cliente IS NOT NULL;

/*consultaE_4*/
SELECT marca, produto, SUM(preco) AS preco_final
FROM t_produtos
GROUP BY marca, produto
HAVING SUM(preco) > 1000;

/*consultaE_4*/
SELECT id_cliente, SUM(preco_frete) AS preco_total
FROM t_pedidos
GROUP BY id_cliente
HAVING SUM(preco_frete) > 20;

/*consultaE_5*/
SELECT a.*, 
       b.legenda,
       c.quantidade
FROM   t_produtos a
JOIN   t_imagens  b  ON  a.id_produtos = b.id_produto
JOIN   t_estoque  c  ON   b.id_produto = c.id_produto
WHERE  a.id_produtos IN (SELECT id_produto FROM t_promocao)
AND    a.id_produtos IN (SELECT id_produto FROM t_estoque WHERE quantidade > 0);

/*consultaE_5*/
SELECT a.id_cliente,
       b.id_carrinho,
       c.id_produtos,
       b.preco_unitario,
       d.status
FROM   t_clientes a
JOIN   t_itens_carrinho   b ON a.id_cliente  = b.id_cliente
JOIN   t_produtos         c ON b.id_produto  = c.id_produtos
JOIN   t_carrinho_compras d ON b.id_carrinho = d.id_carrinho 
WHERE  b.preco_unitario > 3000
AND  d.status = 'Em andamento';
