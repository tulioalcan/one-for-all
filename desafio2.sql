SELECT 
COUNT(song_name) AS cancoes,
COUNT(DISTINCT a.artist_id) AS artistas,
COUNT(DISTINCT	a.album_id) AS albuns
FROM
SpotifyClone.albums AS a
INNER JOIN SpotifyClone.songs AS s
ON a.artist_id = s.album_id;