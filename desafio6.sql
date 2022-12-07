SELECT FORMAT(MIN(valor_plano), 2) faturamento_minimo, FORMAT(MAX(valor_plano), 2) faturamento_maximo, FORMAT(AVG(valor_plano), 2) faturamento_medio, FORMAT(SUM(valor_plano), 2) faturamento_total 
FROM SpotifyClone.plano_usuario
INNER JOIN SpotifyClone.usuario
ON plano_usuario.plano_id = usuario.plano_id;