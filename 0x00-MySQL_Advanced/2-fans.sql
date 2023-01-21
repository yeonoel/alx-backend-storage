-- ranks country origins of bands, ordered by the number of (non-unique) fans
-- Your script can be executed on any database
SELECT origin as origin, SUM(fans) as nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
