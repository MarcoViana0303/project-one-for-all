SELECT ar.nome_artista artista, al.nome_album album FROM SpotifyClone.artista ar
INNER JOIN SpotifyClone.album al
ON ar.id_artista = al.id_artista
WHERE ar.nome_artista = 'Elis Regina';