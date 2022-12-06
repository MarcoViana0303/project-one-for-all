SELECT
    COUNT(c.musica) 'cancoes',
    COUNT( DISTINCT a.nome_artista) 'artistas',
    COUNT( DISTINCT al.album_id) 'albuns'
FROM SpotifyClone.cancoes c
    INNER JOIN SpotifyClone.album al ON c.album_id = al.album_id
    INNER JOIN SpotifyClone.artista a ON a.id_artista = al.id_artista
;