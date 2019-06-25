
DROP MATERIALIZED VIEW IF EXISTS v_immupromised_solid_tumor_without_metastasis CASCADE;
create materialized view v_immupromised_solid_tumor_without_metastasis as

WITH diagnoses_v as
(
select *
from diagnoses_icd
where

	-- Solid tumor without metastasis
	icd9_code between '1400' and '1729'
	or icd9_code between '1740' and '1759'
	or icd9_code between '179' and '1958'
	or icd9_code between '20900' and '20924'
	or icd9_code between '20925' and '2093'
	or icd9_code between '20930' and '20936'
	or icd9_code between '25801' and '25803'

)

select subject_id, hadm_id, seq_num, diagnoses_v.icd9_code, short_title, long_title 
from diagnoses_v, d_icd_diagnoses 
where diagnoses_v.icd9_code=d_icd_diagnoses.icd9_code;