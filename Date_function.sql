

SELECT EMISSAO, 
	YEAR(EMISSAO) AS ANO, 
	DATENAME(mm, EMISSAO) AS MES,
	DAY(EMISSAO) AS DIA,
	DATENAME(dw, EMISSAO) AS DIA,
	DATEDIFF(yy,EMISSAO, GETDATE()) AS AnoDesdeUltimoPedido
FROM VENDAS;
