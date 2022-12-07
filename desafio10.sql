SELECT musica as nome, COUNT(historico_de_reproducoes.id_cancoes) as 'reproducoes' 
FROM SpotifyClone.historico_de_reproducoes
INNER JOIN SpotifyClone.cancoes
ON historico_de_reproducoes.id_cancoes = cancoes.id_cancoes
INNER JOIN SpotifyClone.usuario
ON historico_de_reproducoes.usuario_id = usuario.usuario_id
INNER JOIN SpotifyClone.plano_usuario
ON usuario.plano_id = plano_usuario.plano_id
WHERE plano_usuario.plano IN ('gratuito', 'pessoal')
GROUP BY musica
ORDER BY musica;