
DROP MATERIALIZED VIEW IF EXISTS v_immupromised_lymphoma CASCADE;
create materialized view v_immupromised_lymphoma as

WITH diagnoses_v as
(
select *
from diagnoses_icd
where

	-- Lymphoma
	icd9_code between '20000' and '20238'
	or icd9_code between '20250' and '20301'
	or icd9_code = '2386'
	or icd9_code = '2733'
	or icd9_code between '20302' and '20382'
)

select subject_id, hadm_id, seq_num, diagnoses_v.icd9_code, short_title, long_title 
from diagnoses_v, d_icd_diagnoses 
where diagnoses_v.icd9_code=d_icd_diagnoses.icd9_code;