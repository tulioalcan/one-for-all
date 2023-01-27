SELECT
u.usuario,
COUNT(h.usuario_id) AS qt_de_musicas_ouvidas,
	ROUND(SUM(s.duracao_segundos)/60, 2) AS total_minutos
FROM 
SpotifyClone.historic AS h
INNER JOIN SpotifyClone.user AS u
ON u.usuario_id = h.usuario_id
	INNER JOIN SpotifyClone.songs AS s
    ON h.song_id = s.song_id
GROUP BY u.usuario
  ORDER BY u.usuario;