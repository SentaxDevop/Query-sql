-- Z7Z010 Contem Tabela de codigo da Nota de frete Z7Z_DOC
-- Z6Z010 Contem 0 codigo da nota de frete e o valor da nota Z6Z_DOC e Z6Z_VALTOT


SELECT 
	DISTINCT D2.D2_DOC,
	SUM(Z6.Z6Z_VALTOT) AS TOTAL_FRETE,  
	D2.D2_COD AS CODIGO_PRODUTO, 
	D2.D2_EMISSAO,
	D2.D2_VALBRUT,
	D2.D2_PRCVEN,
	D2.D2_PEDIDO,
	V.COD_VEND,
	V.VENDEDOR,
	V.COD_CLIENTE,
	V.HISTORICO,
	V.NUMCTE
FROM Z7Z010 AS Z7 
INNER JOIN Z6Z010 AS Z6 
	ON Z6.Z6Z_DOC = Z7.Z7Z_DOC
	AND Z6.Z6Z_SERIE = Z7.Z7Z_SERIE
INNER JOIN SD2010 AS D2 
	ON Z7.Z7Z_NOTA = D2.D2_DOC
INNER JOIN SF4010 AS SF 
	ON SF.F4_CODIGO = D2.D2_TES
	AND SF.F4_FILIAL = SUBSTRING(D2.D2_FILIAL, 1, 4)
INNER JOIN VENDAS AS V ON V.NF = D2.D2_DOC
WHERE F4_DUPLIC = 'S'
	AND Z7.D_E_L_E_T_ <> '*' 
	AND Z6.D_E_L_E_T_ <> '*' 
	AND D2.D_E_L_E_T_ <> '*'
	AND V.NUMCTE <> ''
	AND D2.D2_EMISSAO = '20230327' 
	AND D2.D2_DOC = '000023969'
GROUP BY D2.D2_DOC,
	D2.D2_COD,
	D2.D2_EMISSAO,
	D2.D2_VALBRUT,
	D2.D2_PRCVEN,
	D2.D2_PEDIDO,
	V.COD_VEND,
	V.VENDEDOR,
	V.COD_CLIENTE,
	V.HISTORICO,
	V.NUMCTE
