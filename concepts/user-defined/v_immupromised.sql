set search_path to mimiciii;


DROP MATERIALIZED VIEW IF EXISTS v_immupromised CASCADE;
create materialized view v_immupromised as

WITH diagnoses_v as

(

select * 

from diagnoses_icd

where

	-- HIV and AIDS

	icd9_code between '042' and '0449'

	-- Lymphoma

	or icd9_code between '20000' and '20238' 

	or icd9_code between '20250' and '20301' 

	or icd9_code = '2386'

	or icd9_code = '2733'

	or icd9_code between '20302' and '20382'

	-- Metastatic cancer

	or icd9_code between '1960' and '1991'

	or icd9_code between '20970' and '20975'

	or icd9_code = '20979'

	or icd9_code = '78951'

	-- Solid tumor without metastasis

	or icd9_code between '1400' and '1729' 

	or icd9_code between '1740' and '1759' 

	or icd9_code between '179' and '1958' 

	or icd9_code between '20900' and '20924'

	or icd9_code between '20925' and '2093' 

	or icd9_code between '20930' and '20936'

	or icd9_code between '25801' and '25803'

	-- Transplantation

	or icd9_code between '99680' and '99689'

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

	--Autoimmune disease

 or icd9_code between '5550' and '5552' 

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


`