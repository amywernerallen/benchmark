
------------------------------------------------------------------------
-- Script for determining data quality of Maintenance Items in Benchmark
------------------------------------------------------------------------

---------------- Smoking Status ------------------------


select en.enc_rendering_provider_id as provider,
	m.context_id as context,
	sum(case when maint_observation_type in ('Smoking Status', 'Tobacco Status') then 1 else 0 end) as smoking_scrubbed,
	sum(case when maint_observation = 'Y' then 1 else 0 end) as observation_Y,
	sum(case when maint_observation = 'N' then 1 else 0 end) as observation_N,
	sum(case when maint_observation = 'Current Smoker' then 1 else 0 end) as observation_current,
	sum(case when maint_observation = 'nonsmoker' then 1 else 0 end) as observation_non,
	sum(case when maint_observation = 'Former Smoker' then 1 else 0 end) as observation_former,
	count(*) as total_count
from t_maintenance m
inner join t_encounter en
on m.maint_enc_id = en.enc_id
group by enc_rendering_provider_id, m.context_id

---------------------------------------------------------
select distinct(maint_observation), count(*) as count from t_maintenance
where maint_observation_type in (
'Smoking Status', 'Tobacco Status')
group by maint_observation
order by count desc