SELECT 
  CONCAT(ZPU."Borough", ' / ', ZPU."Zone") AS PICKUP_LOC, 
  CONCAT(ZDO."Borough", ' / ', ZDO."Zone") AS DROPOFF_LOC, 
  tip_amount 
FROM 
  GREEN_TAXI_DATA T 
  JOIN ZONES ZPU ON T."PULocationID" = ZPU."LocationID" 
  JOIN ZONES ZDO ON T."DOLocationID" = ZDO."LocationID" 
WHERE 
  ZPU."Zone" = 'Astoria' 
  AND tip_amount in (
    SELECT 
      MAX(tip_amount) 
    from 
      GREEN_TAXI_DATA B 
      JOIN ZONES ZPU ON B."PULocationID" = ZPU."LocationID" 
    WHERE 
      ZPU."Zone" = 'Astoria'
  );
