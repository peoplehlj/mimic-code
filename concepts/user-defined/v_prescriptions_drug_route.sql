
DROP MATERIALIZED VIEW IF EXISTS v_prescriptions_drug_route CASCADE;
create materialized view v_prescriptions_drug_route as

WITH prescriptions_v as

(

select *

from prescriptions

where prescriptions.drug like '%Hydrocortisone%' 

or prescriptions.drug like '%Prednisolone%'

or prescriptions.drug like '%Prednisone%'

or prescriptions.drug like '%Methylprednisolone%'

or prescriptions.drug like '%Dexamethasone%'

or prescriptions.drug like '%Methylprednisone%'

or prescriptions.drug like '%Cortisone%'

or prescriptions.drug like '%Betamethasone%'

or prescriptions.drug like '%Fludrocortisone%'

or prescriptions.drug like '%Triamcinolone%'

)
select * from prescriptions_v where
route ='IV' OR route ='IV DRIP' OR route ='NG' OR route ='PO' OR route ='PO/NG'
;


`