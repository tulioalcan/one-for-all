SELECT 
u.usuario,
IF(YEAR(MAX(h.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.user AS u
INNER JOIN 
SpotifyClone.historic AS h
ON u.usuario_id = h.usuario_id
GROUP BY u.usuario_id
ORDER BY u.usuario;