SELECT COUNT(usuario_id) "quantidade_musicas_no_historico"
FROM SpotifyClone.historico_de_reproducoes
WHERE historico_de_reproducoes.usuario_id = 1;