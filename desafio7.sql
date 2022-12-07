SELECT ar.nome_artista artista, al.nome_album album, COUNT(seg.usuario_id) seguidores
FROM SpotifyClone.artista ar
INNER JOIN SpotifyClone.album al
ON ar.id_artista = al.id_artista
INNER JOIN SpotifyClone.seguindo_artistas seg 
ON ar.id_artista = seg.id_artista
GROUP BY al.album_id
ORDER BY seguidores DESC, artista, album;