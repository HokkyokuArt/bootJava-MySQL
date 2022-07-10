SELECT * from fornecedor;

SELECT nome FROM fornecedor;

SELECT oc.id, oc.data, f.nome, f.ie FROM fornecedor as f, ordem_compra as oc;

SELECT oc.id, oc.data, f.nome, f.ie FROM fornecedor as f, ordem_compra as oc 
WHERE oc.idFornecedor = f.id;

SELECT oc.id, oc.data, f.nome, f.ie FROM fornecedor as f, ordem_compra as oc 
WHERE oc.idFornecedor = f.id 
ORDER BY f.ie

SELECT oc.id, oc.data, f.nome, f.ie FROM fornecedor as f, ordem_compra as oc 
WHERE oc.idFornecedor = f.id 
ORDER BY f.ie DESC

SELECT ioc.idOrdemCompra, ioc.idMaterial, m.nome FROM item_ordem_compra AS ioc, material AS m 
WHERE ioc.idMaterial = m.id 
ORDER BY ioc.idOrdemCompra

SELECT * FROM item_ordem_compra 
WHERE quantidade > 10 AND valor < 50

SELECT *, quantidade*valor as Subtotal 
FROM item_ordem_compra

SELECT idOrdemCompra, SUM(quantidade * valor) as totalCompra FROM item_ordem_compra 
GROUP BY idOrdemCompra

SELECT idOrdemCompra, SUM(valor * quantidade) as totalCompra FROM item_ordem_compra
GROUP by idOrdemCompra 
HAVING totalCompra > 5000

SELECT f.nome, oc.data, sum(valor * quantidade) as total FROM ordem_compra as oc, item_ordem_compra as ioc, fornecedor as f 
WHERE f.id = oc.idFornecedor 
AND oc.id = ioc.idOrdemCompra 
AND oc.data BETWEEN '2022-05-15' AND '2022-05-20' 
GROUP by ioc.idOrdemCompra