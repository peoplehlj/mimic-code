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
\i v_immupromised_autoimmune_disease.sql
\i v_immupromised_hive_aids.sql
\i v_immupromised_lymphoma.sql
\i v_immupromised_metastatic_cancer.sql
\i v_immupromised_solid_tumor_without_metastasis.sql
\i v_immupromised_transplantation.sql

\echo 'v_prescriptions_drug_route views ..'
\i v_prescriptions_drug_route.sql
\i v_prescriptions_drug_route_iv_ivdrip.sql
\i v_prescriptions_drug_route_ng_po_pong.sql

\echo 'Finished loading materialized views.'
