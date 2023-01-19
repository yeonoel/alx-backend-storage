-- lists all bands with Glam rock as their main style, ranked by their longevity
-- Your script can be executed on any database
SELECT band_name as band_name, IFNULL(split, 2023) - IFNULL(formed, 0) as lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
