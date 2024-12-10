
CREATE OR REPLACE FUNCTION GetProfileByExperienceIn(search_text TEXT)
RETURNS TABLE(profile_id INT, profile_name TEXT) AS $$
BEGIN
    RETURN QUERY
    SELECT p.id
    FROM PROFILE p
    JOIN PROFILE_SECTION ps ON p.id = ps.profile_id
    WHERE ps.section_category = 5
    AND ps.content ILIKE '%' || search_text || '%';
END;
$$ LANGUAGE plpgsql;