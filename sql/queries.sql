/* ===================================
   Cyclistic Bike-Share Analysis
   SQL Queries (Case Study)
   =================================== */

/* -----------------------------
   1. Prepare: Create Cleaned Table
   ----------------------------- */
SELECT
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  ride_length_sec,
  day_of_week,
  start_station_name,
  end_station_name,
  member_casual
FROM
  `my-project-070225-464719.cyclistic_data.all_12months_data`
WHERE
  ride_length_sec BETWEEN 60 AND 18000; -- Only rides between 60 seconds and 5 hours


/* -----------------------------
   2. Analyze: Member vs Casual (Average Ride Stats)
   ----------------------------- */
SELECT
  member_casual,
  COUNT(ride_id) AS total_rides,
  ROUND(AVG(ride_length_sec)/60, 2) AS avg_ride_min,
  ROUND(MIN(ride_length_sec)/60, 2) AS min_ride_min,
  ROUND(MAX(ride_length_sec)/60, 2) AS max_ride_min
FROM
  `my-project-070225-464719.cyclistic_data.cleaned_12months_data`
WHERE
  ride_length_sec BETWEEN 60 AND 18000
GROUP BY
  member_casual;


/* -----------------------------
   3. Analyze: Average by Weekday × Member Type
   ----------------------------- */
SELECT
  member_casual,
  day_of_week,
  COUNT(ride_id) AS ride_count,
  ROUND(AVG(ride_length_sec)/60, 2) AS avg_ride_min
FROM
  `my-project-070225-464719.cyclistic_data.cleaned_12months_data`
WHERE
  ride_length_sec BETWEEN 60 AND 18000
GROUP BY
  member_casual, day_of_week
ORDER BY
  member_casual, day_of_week;


/* -----------------------------
   4. Analyze: Bike Type × Member Type
   ----------------------------- */
SELECT
  member_casual,
  rideable_type,
  COUNT(ride_id) AS ride_count,
  ROUND(AVG(ride_length_sec)/60, 2) AS avg_ride_min
FROM
  `my-project-070225-464719.cyclistic_data.cleaned_12months_data`
WHERE
  ride_length_sec BETWEEN 60 AND 18000
GROUP BY
  member_casual, rideable_type
ORDER BY
  member_casual, rideable_type;


/* -----------------------------
   5. Analyze: Ride Counts by Hour of Day
   ----------------------------- */
SELECT
  member_casual,
  EXTRACT(HOUR FROM started_at) AS ride_hour,
  COUNT(*) AS ride_count
FROM
  `my-project-070225-464719.cyclistic_data.cleaned_12months_data`
WHERE
  ride_length_sec BETWEEN 60 AND 18000
GROUP BY
  member_casual, ride_hour
ORDER BY
  member_casual, ride_hour;


/* -----------------------------
   6. Analyze: Ride Counts by Month
   ----------------------------- */
SELECT
  member_casual,
  EXTRACT(MONTH FROM started_at) AS month,
  COUNT(*) AS ride_count,
  AVG(ride_length_sec) / 60 AS avg_ride_min
FROM
  `my-project-070225-464719.cyclistic_data.cleaned_12months_data`
WHERE
  ride_length_sec BETWEEN 60 AND 18000
GROUP BY
  member_casual, month
ORDER BY
  member_casual, month;
