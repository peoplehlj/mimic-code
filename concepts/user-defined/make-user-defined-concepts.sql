--
-- su mimicuser && psql 'dbname=mimic user=mimicuser options=--search_path=mimiciii' -f make-user-defined-concepts.sql
--

\echo ''
\echo '==='
\echo 'Beginning to create our own materialized views for MIMIC database.'
\echo 'Any notices of the form "NOTICE: materialized view "XXXXXX" does not exist" can be ignored.'
\echo 'The scripts drop views before creating them, and these notices indicate nothing existed prior to creating the view.'
\echo '==='
\echo ''

\echo 'user-defined views ..'

\echo 'v_immupromised views ..'
\i v_immupromised.sql
\i v_immupromised-autoimmune-disease.sql
\i v_immupromised-hive-aids.sql
\i v_immupromised-lymphoma.sql
\i v_immupromised-metastatic-cancer.sql
\i v_immupromised-solid-tumor-without-metastasis.sql
\i v_immupromised-transplantation.sql

\echo 'v_prescriptions_drug_route views ..'
\i v_prescriptions_drug_route.sql
\i v_prescriptions_drug_route-iv-ivdrip.sql
\i v_prescriptions_drug_route-ng-po-pong.sql

\echo 'Finished loading materialized views.'
