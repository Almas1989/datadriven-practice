SELECT
    CAST(COUNT(DISTINCT call_id) AS DECIMAL(10,1)) AS after_hours_count
FROM api_calls
WHERE call_time >= '2025-01-01'
  AND call_time < '2026-01-01'
  AND (
      EXTRACT(DOW FROM call_time) IN (0, 6)
      OR EXTRACT(HOUR FROM call_time) < 9
      OR EXTRACT(HOUR FROM call_time) >= 16
  );
