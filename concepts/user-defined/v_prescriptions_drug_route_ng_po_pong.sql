-----------------------------------
-- ����������AND����route����ҩ;����5�֣�IV OR IV DRIP OR NG OR PO OR PO/NG������һ��view.
-- ��ҩ;����route����IV��IV DRIP����һ�飬NG ��PO��PO/NG����һ�顣
-- set search_path to mimiciii;
------------------------------------

DROP MATERIALIZED VIEW IF EXISTS v_prescriptions_drug_route_ng_po_pong CASCADE;
create materialized view v_prescriptions_drug_route_ng_po_pong as

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
route ='NG' OR route ='PO' OR route ='PO/NG'
;