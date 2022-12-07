SELECT usuario.nome_usuario AS usuario,
CASE WHEN YEAR(MAX(historico_de_reproducoes.reproduction_date)) >= 2021 THEN 'Usuário ativo'
ELSE 'Usuário inativo'
END status_usuario
FROM SpotifyClone.usuario
INNER JOIN SpotifyClone.historico_de_reproducoes
ON usuario.usuario_id = historico_de_reproducoes.usuario_id
GROUP BY usuario
ORDER BY usuario;