INSERT INTO categorias (nome) VALUES ('Doces');
SELECT * FROM categorias;

CREATE TABLE canais_venda (
    id_canal INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE, -- Ex: 'Salão Parceiro', 'Salão Padrão', 'Venda Direta'
    descricao VARCHAR(150)
    );
    
    CREATE TABLE tabela_precos (
    id_preco INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    id_canal INT NOT NULL,
    preco_venda DECIMAL(10, 2) NOT NULL CHECK (preco_venda > 0),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) ON DELETE CASCADE,
    FOREIGN KEY (id_canal) REFERENCES canais_venda(id_canal),
    UNIQUE KEY uk_produto_canal (id_produto, id_canal) -- Impede duplicar preço do mesmo doce no mesmo canal
);

INSERT INTO canais_venda (nome, descricao) VALUES
('Salão Parceiro', 'Salões de festas com contrato ou parceria recorrente'),
('Salão Padrão', 'Tabela B2B para salões avulsos ou novos contatos'),
('Venda Direta', 'Cliente final (varejo / encomenda direta)');

ALTER TABLE produtos
DROP COLUMN preco_venda,
ADD COLUMN preco_salao_parceiro DECIMAL(10, 2) NOT NULL CHECK (preco_salao_parceiro > 0),
ADD COLUMN preco_salao_padrao   DECIMAL(10, 2) NOT NULL CHECK (preco_salao_padrao > 0),
ADD COLUMN preco_venda_direta   DECIMAL(10, 2) NOT NULL CHECK (preco_venda_direta > 0);

DESCRIBE produtos;
SELECT * FROM categorias;

INSERT INTO produtos (
    id_categoria,
    nome,
    unidade_medida,
    custo_producao,
    preco_salao_parceiro,
    preco_salao_padrao,
    preco_venda_direta,
    eh_kit
) VALUES (
    1,
    'Doce de Limão',
    'unidade',
    1.03,
    2.30,
    2.60,
    3.10,
    FALSE
);


SELECT * FROM produtos WHERE nome = 'Doce de Limão';

INSERT INTO produtos (
    id_categoria,
    nome,
    unidade_medida,
    custo_producao,
    preco_salao_parceiro,
    preco_salao_padrao,
    preco_venda_direta,
    eh_kit
) VALUES
(1, 'Brigadeiro Branco', 'unidade', 0.86, 2.20, 2.50, 3.00, FALSE),
(1, 'Paçoca', 'unidade', 0.91, 2.20, 2.50, 3.00, FALSE),
(1, 'Coco Queimado', 'unidade', 1.09, 2.40, 2.80, 3.30, FALSE),
(1, 'Brigadeiro Preto', 'unidade', 0.93, 2.20, 2.50, 3.00, FALSE),
(1, 'Prestígio', 'unidade', 1.00, 2.30, 2.60, 3.10, FALSE),
(1, 'Flake', 'unidade', 0.96, 2.20, 2.50, 3.00, FALSE);

SELECT 
    id_produto,
    nome,
    unidade_medida,
    custo_producao,
    preco_salao_parceiro,
    preco_salao_padrao,
    preco_venda_direta
FROM produtos
WHERE eh_kit = FALSE;
