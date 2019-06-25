
DROP MATERIALIZED VIEW IF EXISTS v_immupromised_autoimmune_disease CASCADE;
create materialized view v_immupromised_autoimmune_disease as

WITH diagnoses_v as
(
select *
from diagnoses_icd
where
	--Autoimmune disease
 icd9_code between '5550' and '5552'
 or icd9_code between '35800' and '35801'
 or icd9_code between '7100' and '7105'
 or icd9_code between '7108' and '7109'
 or icd9_code between '5565' and '5566'
 or icd9_code between '5568' and '5569'
 or icd9_code = '7010'
 or icd9_code = '7140'
 or icd9_code = '5559'
 or icd9_code = '340'
 or icd9_code = '7200'
 or icd9_code = '6960'
 or icd9_code = '35971'
 or icd9_code = '4465'
)

select subject_id, hadm_id, seq_num, diagnoses_v.icd9_code, short_title, long_title 
from diagnoses_v, d_icd_diagnoses 
where diagnoses_v.icd9_code=d_icd_diagnoses.icd9_code;