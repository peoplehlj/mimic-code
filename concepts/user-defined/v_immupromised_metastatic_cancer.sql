
DROP MATERIALIZED VIEW IF EXISTS v_immupromised_metastatic_cancer CASCADE;
create materialized view v_immupromised_metastatic_cancer as

WITH diagnoses_v as
(
select *
from diagnoses_icd
where
	-- Metastatic cancer
	icd9_code between '1960' and '1991'
	or icd9_code between '20970' and '20975'
	or icd9_code = '20979'
	or icd9_code = '78951'
)

select subject_id, hadm_id, seq_num, diagnoses_v.icd9_code, short_title, long_title 
from diagnoses_v, d_icd_diagnoses 
where diagnoses_v.icd9_code=d_icd_diagnoses.icd9_code;