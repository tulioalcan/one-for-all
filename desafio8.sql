SELECT 
a.artista AS artista,
al.album AS album
FROM 
SpotifyClone.artist AS a
INNER JOIN 
SpotifyClone.albums AS al 
ON al.artist_id = a.artist_id
WHERE a.artista = 'Elis Regina'
ORDER BY album;