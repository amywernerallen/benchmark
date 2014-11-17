
select distinct pp.person_id as personid,
				tpr.icd9_code as icd9_prob,
				ta.icd9_code as icd9_assess,
				td.diag_ICD9Code as icd9_diag,
				vit.vitals_date as vitdate,
				avg(case when try_convert(numeric, vit.vitals_systolic) is NOT NULL then cast(vit.vitals_systolic as numeric) else 0 end) as systolic, 
				avg(case when try_convert(numeric, vit.vitals_diastolic) is NOT NULL then cast(vit.vitals_diastolic as numeric) else 0 end) as diastolic,
				res.lab_type as labtype,
				res.collection_date as labdate,
				avg(case when try_convert(numeric, res.result_value) is NOT NULL then cast(res.result_value as numeric) else 0 end) as labvalue
from mpi.person_patient pp
join t_patient tp
on tp.pat_id = pp.pat_id
join t_problem tpr
on tpr.[icd9_code] like '250.[00-93]%'
AND tpr.patient_id = tp.pat_id
join t_assessment ta
on ta.[icd9_code] like '250.[00-93]%'
AND ta.patient_id = tp.pat_id
join dbo.t_diagnosis td
on td.[diag_ICD9Code] like '250.[00-93]%'
AND td.[diag_patient_id] = tp.[pat_id]
inner join dbo.t_vitals vit
on vit.vitals_patient_id = tp.pat_id
inner join dbo.t_result res
on res.pat_id = tp.pat_id
where res.lab_type like '%a1c%'
and vit.vitals_date = res.collection_date

group by pp.person_id, 
		vit.vitals_date, res.collection_date,
		tpr.icd9_code,
		ta.icd9_code,
		td.diag_ICD9Code,
		res.lab_type

-----------------------------------------
select * from lookup.hcc_icd9
where CMS_HCC_v12 in (15, 16, 17, 18, 19)
order by CMS_HCC_v12 

select * from t_vitals