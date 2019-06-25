
DROP MATERIALIZED VIEW IF EXISTS v_immupromised_transplantation CASCADE;
create materialized view v_immupromised_transplantation as

WITH diagnoses_v as
(
select *
from diagnoses_icd
where

	-- Transplantation
	icd9_code between '99680' and '99689'
	or icd9_code = 'V420'
	or icd9_code = 'V421'
	or icd9_code = 'V422'
	or icd9_code = 'V423'
	or icd9_code = 'V424'
	or icd9_code = 'V425'
	or icd9_code = 'V426'
	or icd9_code = 'V427'
	or icd9_code = 'V4281'
	or icd9_code = 'V4282'
	or icd9_code = 'V4283'
	or icd9_code = 'V4284'
	or icd9_code = 'V4289'
	or icd9_code = 'V429'
  or icd9_code = '23877'
  or icd9_code = '1992'

)

select subject_id, hadm_id, seq_num, diagnoses_v.icd9_code, short_title, long_title 
from diagnoses_v, d_icd_diagnoses 
where diagnoses_v.icd9_code=d_icd_diagnoses.icd9_code;