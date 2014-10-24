
-------------------------------------------------------------
-- Script for determining data quality of vitals in Benchmark
-------------------------------------------------------------

---------------- HEIGHTS ------------------------
select vitals_prov_id as provider,
	context_id as context,
	avg(vitals_height) as ave_height,
	stdev(vitals_height) as std_height,
	sum(case when vitals_height is NULL then 1 else 0 end) as height_null,
	sum(case when (cast(vitals_height as int) % 12) = 0 and vitals_height != 0 then 1 else 0 end) as mod_0,
	sum(case when (cast(vitals_height as int) % 12) = 1 then 1 else 0 end) as mod_1,
	sum(case when (cast(vitals_height as int) % 12) = 2 then 1 else 0 end) as mod_2,
	sum(case when (cast(vitals_height as int) % 12) = 3 then 1 else 0 end) as mod_3,
	sum(case when (cast(vitals_height as int) % 12) = 4 then 1 else 0 end) as mod_4,
	sum(case when (cast(vitals_height as int) % 12) = 5 then 1 else 0 end) as mod_5,
	sum(case when (cast(vitals_height as int) % 12) = 6 then 1 else 0 end) as mod_6,
	sum(case when (cast(vitals_height as int) % 12) = 7 then 1 else 0 end) as mod_7,
	sum(case when (cast(vitals_height as int) % 12) = 8 then 1 else 0 end) as mod_8,
	sum(case when (cast(vitals_height as int) % 12) = 9 then 1 else 0 end) as mod_9,
	sum(case when (cast(vitals_height as int) % 12) = 10 then 1 else 0 end) as mod_10,
	sum(case when (cast(vitals_height as int) % 12) = 11 then 1 else 0 end) as mod_11,
	count(*) as total_count
from t_vitals
group by vitals_prov_id, context_id

select vitals_prov_id as provider, context_id as context, avg(vitals_height) as ave_height, stdev(vitals_height) as std_height, sum(case when vitals_height is NULL then 1 else 0 end) as height_null, sum(case when (cast(vitals_height as int) % 12) = 0 and vitals_height != 0 then 1 else 0 end) as mod_0, sum(case when (cast(vitals_height as int) % 12) = 1 then 1 else 0 end) as mod_1, sum(case when (cast(vitals_height as int) % 12) = 2 then 1 else 0 end) as mod_2, sum(case when (cast(vitals_height as int) % 12) = 3 then 1 else 0 end) as mod_3, sum(case when (cast(vitals_height as int) % 12) = 4 then 1 else 0 end) as mod_4, sum(case when (cast(vitals_height as int) % 12) = 5 then 1 else 0 end) as mod_5, sum(case when (cast(vitals_height as int) % 12) = 6 then 1 else 0 end) as mod_6, sum(case when (cast(vitals_height as int) % 12) = 7 then 1 else 0 end) as mod_7, sum(case when (cast(vitals_height as int) % 12) = 8 then 1 else 0 end) as mod_8, sum(case when (cast(vitals_height as int) % 12) = 9 then 1 else 0 end) as mod_9, sum(case when (cast(vitals_height as int) % 12) = 10 then 1 else 0 end) as mod_10, sum(case when (cast(vitals_height as int) % 12) = 11 then 1 else 0 end) as mod_11, count(*) as total_count from t_vitals group by vitals_prov_id, context_id

---------------- WEIGHTS ------------------------
select vitals_prov_id as provider,
	context_id as context,
	avg(vitals_weight) as ave_weight,
	stdev(vitals_weight) as std_weight,
	sum(case when vitals_height is NULL then 1 else 0 end) as height_null,
	sum(case when (cast(vitals_weight as int) % 10) = 0 and vitals_weight != 0 then 1 else 0 end) as mod_0,
	sum(case when (cast(vitals_weight as int) % 10) = 1 then 1 else 0 end) as mod_1,
	sum(case when (cast(vitals_weight as int) % 10) = 2 then 1 else 0 end) as mod_2,
	sum(case when (cast(vitals_weight as int) % 10) = 3 then 1 else 0 end) as mod_3,
	sum(case when (cast(vitals_weight as int) % 10) = 4 then 1 else 0 end) as mod_4,
	sum(case when (cast(vitals_weight as int) % 10) = 5 then 1 else 0 end) as mod_5,
	sum(case when (cast(vitals_weight as int) % 10) = 6 then 1 else 0 end) as mod_6,
	sum(case when (cast(vitals_weight as int) % 10) = 7 then 1 else 0 end) as mod_7,
	sum(case when (cast(vitals_weight as int) % 10) = 8 then 1 else 0 end) as mod_8,
	sum(case when (cast(vitals_weight as int) % 10) = 9 then 1 else 0 end) as mod_9,
	count(*) as total_count
from t_vitals
group by vitals_prov_id, context_id

---------------- BP ----------------------
select vitals_prov_id as provider,
	context_id as context,
	avg(vitals_systolic) as ave_systolic,
	stdev(vitals_systolic) as std_diastolic,
	sum(case when vitals_systolic is NULL then 1 else 0 end) as systolic_null,
	sum(case when (cast(vitals_systolic as int) % 10) = 0 and vitals_weight != 0 then 1 else 0 end) as mod_0,
	sum(case when (cast(vitals_systolic as int) % 10) = 1 then 1 else 0 end) as mod_1,
	sum(case when (cast(vitals_systolic as int) % 10) = 2 then 1 else 0 end) as mod_2,
	sum(case when (cast(vitals_systolic as int) % 10) = 3 then 1 else 0 end) as mod_3,
	sum(case when (cast(vitals_systolic as int) % 10) = 4 then 1 else 0 end) as mod_4,
	sum(case when (cast(vitals_systolic as int) % 10) = 5 then 1 else 0 end) as mod_5,
	sum(case when (cast(vitals_systolic as int) % 10) = 6 then 1 else 0 end) as mod_6,
	sum(case when (cast(vitals_systolic as int) % 10) = 7 then 1 else 0 end) as mod_7,
	sum(case when (cast(vitals_systolic as int) % 10) = 8 then 1 else 0 end) as mod_8,
	sum(case when (cast(vitals_systolic as int) % 10) = 9 then 1 else 0 end) as mod_9,
	count(*) as total_count
from t_vitals
group by vitals_prov_id, context_id

---------------------------------------------------------------
select vitals_prov_id as provider,
	context_id as context,
	avg(vitals_diastolic) as ave_diastolic,
	stdev(vitals_diastolic) as std_diastolic,
	sum(case when vitals_diastolic is NULL then 1 else 0 end) as diastolic_null,
	sum(case when (cast(vitals_diastolic as int) % 10) = 0 and vitals_weight != 0 then 1 else 0 end) as mod_0,
	sum(case when (cast(vitals_diastolic as int) % 10) = 1 then 1 else 0 end) as mod_1,
	sum(case when (cast(vitals_diastolic as int) % 10) = 2 then 1 else 0 end) as mod_2,
	sum(case when (cast(vitals_diastolic as int) % 10) = 3 then 1 else 0 end) as mod_3,
	sum(case when (cast(vitals_diastolic as int) % 10) = 4 then 1 else 0 end) as mod_4,
	sum(case when (cast(vitals_diastolic as int) % 10) = 5 then 1 else 0 end) as mod_5,
	sum(case when (cast(vitals_diastolic as int) % 10) = 6 then 1 else 0 end) as mod_6,
	sum(case when (cast(vitals_diastolic as int) % 10) = 7 then 1 else 0 end) as mod_7,
	sum(case when (cast(vitals_diastolic as int) % 10) = 8 then 1 else 0 end) as mod_8,
	sum(case when (cast(vitals_diastolic as int) % 10) = 9 then 1 else 0 end) as mod_9,
	count(*) as total_count
from t_vitals
group by vitals_prov_id, context_id

