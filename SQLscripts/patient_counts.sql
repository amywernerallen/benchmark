select sm.site_Center_Name as site_name,
count(distinct enc.enc_patient_id) as pat_count
from t_encounter enc
inner join t_patient pat
on enc.enc_patient_id = pat.pat_id
inner join site_master sm
on pat.pat_site_id = sm.site_id
where sm.site_Center_Name not in (
'Country Doc',
'Family Care',
'Healthpoint',
'Neighborcare',
'NEWHP',
'PCHS',
'Yakima Neighborhood Health Services')
and enc.enc_timestamp between '1-1-2012' and '1-1-2014'
group by sm.site_Center_Name
order by sm.site_Center_Name

------------------------------------------------

select sm.site_Center_Name as site_name,
count(distinct enc.enc_patient_id) as pat_count
from t_encounter enc
inner join t_patient pat
on enc.enc_patient_id = pat.pat_id
inner join site_master sm
on pat.pat_site_id = sm.site_id
where sm.site_Center_Name not in (
'Country Doc',
'Family Care',
'Healthpoint',
'Neighborcare',
'NEWHP',
'PCHS',
'Yakima Neighborhood Health Services')
and enc.enc_timestamp between DATEADD(year,-2,getdate()) AND GETDATE() 
group by sm.site_Center_Name
order by sm.site_Center_Name

select count(distinct enc.enc_patient_id) from t_encounter enc
inner join site_master sm
on enc.enc_site_id = sm.site_id
where enc_timestamp is NULL