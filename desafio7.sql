SELECT 
a.artista, 
al.album,
COUNT(f.artist_id) AS seguidores
FROM
SpotifyClone.artist as a
INNER JOIN 
SpotifyClone.albums as al
ON a.artist_id = al.artist_id
	INNER JOIN	SpotifyClone.follow as f
		ON a.artist_id = f.artist_id
GROUP BY al.album_id
ORDER BY seguidores DESC, a.artista, al.album;