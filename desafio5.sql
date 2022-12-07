SELECT cancoes.musica cancao, COUNT(historico_de_reproducoes.id_cancoes) reproducoes
FROM SpotifyClone.cancoes
INNER JOIN SpotifyClone.historico_de_reproducoes
ON cancoes.id_cancoes = historico_de_reproducoes.id_cancoes
GROUP BY musica
ORDER BY reproducoes DESC, cancao
LIMIT 2;