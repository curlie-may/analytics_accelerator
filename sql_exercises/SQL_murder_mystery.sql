--https://mystery.knightlab.com/
--Murderer is 
id	   name	           license_id	address_number	address_street_name	   ssn
67318	 Jeremy Bowers	423327	    530	            Washington Pl, Apt 3A	 871539279



/*
select *
from interview
where person_id = 16371 or person_id = 14887
              
*/

/*
select *
from interview
where person_id = 28819 or person_id = 67318
*/

select *
from person 
where id = 67318


/*
with check_in as (
select *
from get_fit_now_check_in
where check_in_date = 20180109 and membership_id like '48Z%'
)
select * 
from get_fit_now_member as m
left join check_in as c
on c.membership_id = m.id
where membership_status = 'gold' and id like'%48Z%'
*/

/*
select *
from drivers_license
where plate_number like '%H42W%'
*/

--Congrats, you found the murderer! But wait, there's more... 
--If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime. 
--If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. Use this same INSERT statement 
--with your new suspect to check your answer.

--Answer: Instigator behind murder is Miranda Priestly (she went to SQL concert 3 times in December 2017 based on interview notes)
id	name	license_id	address_number	address_street_name	ssn	person_id	event_id	event_name	date
90700	Regina George	291182	332	Maple Ave	337169072	null	null	null	null
99716	Miranda Priestly	202298	1883	Golden Ave	987756388	99716	1143	SQL Symphony Concert	20171206
99716	Miranda Priestly	202298	1883	Golden Ave	987756388	99716	1143	SQL Symphony Concert	20171212
99716	Miranda Priestly	202298	1883	Golden Ave	987756388	99716	1143	SQL Symphony Concert	20171229


select *
from drivers_license
where hair_color = 'red' and car_make = 'Tesla' and car_model = 'Model S' and gender = 'female'


with suspect as ( 
select *
from facebook_event_checkin as face_event
where event_name like '%SQL%'
)  
select *
from person 
left join suspect
on suspect.person_id = person.id
where license_id = 202298 or license_id = 291182

-----Complete query set random order --------------------------
/*
select *
from interview
where person_id = 16371 or person_id = 14887
*/              

/*
select *
from interview
where person_id = 28819 or person_id = 67318
*/

/*
select *
from drivers_license
where hair_color = 'red' and car_make = 'Tesla' and car_model = 'Model S' and gender = 'female'
*/

/*
with suspect as ( 
select *
from facebook_event_checkin as face_event
where event_name like '%SQL%'
)  
select *
from person 
left join suspect
on suspect.person_id = person.id
where license_id = 202298 or license_id = 291182
*/

/*
select *
from facebook_event_checkin as face
left join license_person 
on face.person_id = license_person.id
where event_name like '%SQL%'
*/  
  
/*
select *
from person 
where id = 67318
*/

/*
with check_in as (
select *
from get_fit_now_check_in
where check_in_date = 20180109 and membership_id like '48Z%'
)
select * 
from get_fit_now_member as m
left join check_in as c
on c.membership_id = m.id
where membership_status = 'gold' and id like'%48Z%'
*/

/*
select *
from drivers_license
where plate_number like '%H42W%'
*/

              


