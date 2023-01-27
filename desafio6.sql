SELECT 
MIN(s.valor_plano) AS 'faturamento_minimo',
MAX(s.valor_plano) AS 'faturamento_maximo',
ROUND(AVG(s.valor_plano), 2) AS 'faturamento_medio',
SUM(s.valor_plano) AS faturamento_total
FROM
SpotifyClone.sing as s
INNER JOIN SpotifyClone.user as u
ON s.plano_id = u.plano_id;