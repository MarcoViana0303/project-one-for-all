SELECT DISTINCT u.nome_usuario AS 'usuario', COUNT(his.usuario_id) AS 'qt_de_musicas_ouvidas', ROUND(SUM(can.duracao_segundos) / 60, 2) AS 'total_minutos'
FROM SpotifyClone.historico_de_reproducoes his
INNER JOIN SpotifyClone.usuario u 
ON his.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.cancoes can
ON his.id_cancoes = can.id_cancoes
GROUP BY his.usuario_id 
ORDER BY u.nome_usuario;