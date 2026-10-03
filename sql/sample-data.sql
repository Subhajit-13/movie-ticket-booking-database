-- ============================================
-- THEATERS
-- ============================================

INSERT INTO theaters (name, address, city)
VALUES
    (
        'PVR INOX South City Mall',
        '375 Prince Anwar Shah Road, South City Mall',
        'Kolkata'
    ),
    (
        'INOX Quest Mall',
        '33 Syed Amir Ali Avenue, Quest Mall',
        'Kolkata'
    ),
    (
        'Cinepolis Acropolis',
        '1858 Rajdanga Main Road, Acropolis Mall',
        'Kolkata'
    );

    -- ============================================
-- SCREENS
-- ============================================

INSERT INTO screens (theater_id, name)
VALUES
    (1, 'Screen 1'),
    (1, 'Screen 2'),
    (1, 'Screen 3'),
    (2, 'Screen 1'),
    (2, 'Screen 2'),
    (3, 'Screen 1'),
    (3, 'Screen 2'),
    (3, 'Screen 3');

    -- ============================================
-- SEATS
-- ============================================

INSERT INTO seats (screen_id, row_name, seat_number, seat_type)
SELECT
    s.screen_id,
    rows.row_name,
    numbers.seat_number,
    CASE
        WHEN rows.row_name = 'C' THEN 'Premium'
        ELSE 'Regular'
    END
FROM screens s
CROSS JOIN (
    VALUES ('A'), ('B'), ('C')
) AS rows(row_name)
CROSS JOIN (
    SELECT generate_series(1, 5) AS seat_number
) AS numbers;

-- ============================================
-- MOVIES
-- ============================================

INSERT INTO movies (
    title,
    description,
    duration_minutes,
    language,
    release_date
)
VALUES
    (
        'The Last Horizon',
        'A science-fiction crew searches for a habitable world beyond the known frontier.',
        142,
        'English',
        '2026-07-10'
    ),
    (
        'Shadow Protocol',
        'A cybersecurity analyst uncovers a global conspiracy hidden inside a classified system.',
        128,
        'English',
        '2026-08-21'
    ),
    (
        'Kolkata Nights',
        'Interconnected lives unfold across Kolkata over one unforgettable night.',
        135,
        'Bengali',
        '2026-09-05'
    ),
    (
        'Operation Thunder',
        'A special operations team takes on a high-risk mission with global consequences.',
        155,
        'Hindi',
        '2026-09-18'
    );

-- ============================================
-- SHOWS
-- ============================================

INSERT INTO shows (
    movie_id,
    screen_id,
    start_time,
    end_time
)
VALUES
    -- PVR INOX South City Mall
    (1, 1, '2026-10-05 10:00:00+05:30', '2026-10-05 12:22:00+05:30'),
    (2, 1, '2026-10-05 14:00:00+05:30', '2026-10-05 16:08:00+05:30'),
    (3, 2, '2026-10-05 11:00:00+05:30', '2026-10-05 13:15:00+05:30'),
    (4, 2, '2026-10-05 17:00:00+05:30', '2026-10-05 19:35:00+05:30'),
    (1, 3, '2026-10-05 20:00:00+05:30', '2026-10-05 22:22:00+05:30'),

    -- INOX Quest Mall
    (2, 4, '2026-10-05 10:30:00+05:30', '2026-10-05 12:38:00+05:30'),
    (3, 4, '2026-10-05 15:00:00+05:30', '2026-10-05 17:15:00+05:30'),
    (4, 5, '2026-10-05 18:00:00+05:30', '2026-10-05 20:35:00+05:30'),

    -- Cinepolis Acropolis
    (3, 6, '2026-10-05 09:30:00+05:30', '2026-10-05 11:45:00+05:30'),
    (1, 7, '2026-10-05 13:00:00+05:30', '2026-10-05 15:22:00+05:30'),
    (2, 7, '2026-10-05 17:00:00+05:30', '2026-10-05 19:08:00+05:30'),
    (4, 8, '2026-10-05 20:00:00+05:30', '2026-10-05 22:35:00+05:30');

