--1. Exiba os dados da compra (item_ordem_compra) de todos os materiais cujo quantidade seja maior que 10.
SELECT * FROM item_ordem_compra 
WHERE quantidade > 10

--2. Exiba os dados da compra (item_ordem_compra) de todos os materiais cujo valor seja menor que 50.
SELECT * FROM item_ordem_compra 
WHERE valor < 50

--3. Exibir os dados da compra de todos os materiais cuja quantidade seja maior que 100 e o valor seja menor que 50, contendo o nome do material e o nome do fornecedor.
SELECT ioc.idOrdemCompra, ioc.idMaterial,ioc.quantidade, m.nome, f.nome FROM item_ordem_compra as ioc, material as m, fornecedor as f, ordem_compra as o
WHERE ioc.quantidade>100 AND ioc.valor<50 AND ioc.idMaterial = m.id AND ioc.idOrdemCompra = o.id AND o.idFornecedor = f.id;

-- 4. Exiba o subtotal de cada material  vendido, o nome do material e o nome do fornecedor, para cada item_ordem_compra.
SELECT ioc.idOrdemCompra, ioc.idMaterial,ioc.quantidade, ioc.valor, m.nome, f.nome 
FROM item_ordem_compra as ioc, material as m, fornecedor as f, ordem_compra as oc
WHERE ioc.idMaterial = m.id
AND f.id = oc.idFornecedor
AND oc.id = ioc.idOrdemCompra
ORDER BY ioc.idOrdemCompra;

-- 5. O nome do fornecedor da ordem de compra, a ordem de compra e o total pago pela ordem de compra.
SELECT ioc.idOrdemCompra, f.nome, SUM(valor * quantidade) as totalCompra 
FROM fornecedor as f, ordem_compra as oc, item_ordem_compra as ioc 
WHERE oc.idFornecedor = f.id 
AND oc.id = ioc.idOrdemCompra 
GROUP BY ioc.idOrdemCompra 
ORDER BY oc.id;


-- 6. O nome do fornecedor da ordem de compra, a data da ordem de compra, o total pago pela ordem de compra, num determinado intervalo de datas.
SELECT f.nome, oc.data, SUM(valor * quantidade) as total FROM ordem_compra as oc, item_ordem_compra as ioc, fornecedor as f 
WHERE f.id = oc.idFornecedor 
AND oc.id = ioc.idOrdemCompra 
AND oc.data BETWEEN '2022-05-15' AND '2022-05-20' 
GROUP by ioc.idOrdemCompra
