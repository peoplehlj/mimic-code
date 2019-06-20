-- psql 'dbname=mimic user=mimicuser options=--search_path=mimiciii' -f make-own-concepts.sql
--

\echo ''
\echo '==='
\echo 'Beginning to create our own materialized views for MIMIC database.'
\echo 'Any notices of the form "NOTICE: materialized view "XXXXXX" does not exist" can be ignored.'
\echo 'The scripts drop views before creating them, and these notices indicate nothing existed prior to creating the view.'
\echo '==='
\echo ''

\echo 'Specific ..'
\i cookbook/glucose.sql
\i cookbook/mortality.sql

-- Durations
\echo 'Directory 1 of 1: durations'
\i durations/dobutamine-dose.sql
\i durations/dopamine-dose.sql
\i durations/epinephrine-dose.sql
\i durations/norepinephrine-dose.sql
\i durations/phenylephrine-dose.sql
\i durations/vasopressin-dose.sql


\echo 'Finished loading materialized views.'
