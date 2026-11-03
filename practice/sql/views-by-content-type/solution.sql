SELECT
    ci.content_type,
    SUM(cv.view_count) AS view_count
FROM content_items ci
JOIN (
    SELECT
        content_id,
        COUNT(view_id) AS view_count
    FROM content_views
    GROUP BY content_id
) cv ON ci.content_id = cv.content_id
GROUP BY ci.content_type;
