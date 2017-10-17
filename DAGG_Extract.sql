

 
 sel COALESCE (L.week_of_year, LL.week_of_year, P.week_of_year, T.week_of_year ) as WEEK_OF_YR, 
 COALESCE (L.route_name, LL.route_name, P.route_name, T.route_name ) as route_name, 
 COALESCE (L.route_id, LL.route_id, P.route_id, T.route_id )as route_id, 
 COALESCE (L.delivery_point_ref_num, LL.delivery_point_ref_num, P.delivery_point_ref_num, T.delivery_point_ref_num )as delivery_point_ref_num,  
 LL.LARGE_LETTERS,  L.LETTERS, P.PARCELS, T.TRACKED
 FROM
 (sel ---top 10 *
 cal.week_of_year, min (cal.calendar_date) as WC, max (cal.calendar_date) as WE,
 dagg.route_name, dagg.route_id, delivery_point_ref_num , sum(Volume) AS LARGE_LETTERS
 from EDW_SCVER_CODA_ACCS_VIEWS.v_DP_DAILY_AGG dagg
 inner join SYS_CALENDAR.Calendar cal on dagg.delivery_date = cal.calendar_date
 and dagg.source_system = 'MEARS-ADF'
 and dagg.postal_piece_type_desc = 'LARGE LETTER'
 and dagg.location_name_rln 
 IN (
 --'Northwood DO', 	
 'Ripley DE DO' ---, DE same?
 --'Plympton DO',
 --'Valley DO'
 )  
 Group by 1, 4, 5, 6) LL
 FULL JOIN
 (sel ---top 10 *
 cal.week_of_year, min (cal.calendar_date) as WC, max (cal.calendar_date) as WE,
 dagg.route_name, dagg.route_id, delivery_point_ref_num , sum(Volume) AS LETTERS
 from EDW_SCVER_CODA_ACCS_VIEWS.v_DP_DAILY_AGG dagg
 inner join SYS_CALENDAR.Calendar cal on dagg.delivery_date = cal.calendar_date
 and dagg.source_system = 'MEARS-ADF'
 and dagg.postal_piece_type_desc = 'LETTER'
 and dagg.location_name_rln 
 IN (
 --'Northwood DO', 	
 'Ripley DE DO' ---, DE same?
 --'Plympton DO',
 --'Valley DO'
 )  
 Group by 1, 4, 5, 6) L
 ON  L.week_of_year              = LL.week_of_year
 AND L.route_name                = LL.route_name
 AND L.route_id                  = LL.route_id  
 AND L.delivery_point_ref_num    = LL.delivery_point_ref_num
 FULL JOIN
 
 (sel ---top 10 *
 cal.week_of_year, min (cal.calendar_date) as WC, max (cal.calendar_date) as WE,
 dagg.route_name, dagg.route_id, delivery_point_ref_num , sum(Volume) AS PARCELS
 from EDW_SCVER_CODA_ACCS_VIEWS.v_DP_DAILY_AGG dagg
 inner join SYS_CALENDAR.Calendar cal on dagg.delivery_date = cal.calendar_date
 and dagg.source_system = 'PARCELS'
 and dagg.location_name_rln 
 IN (
 --'Northwood DO', 	
 'Ripley DE DO' ---, DE same?
 --'Plympton DO',
 --'Valley DO'
 )  
 Group by 1, 4, 5, 6 ) P
 
 ON  L.week_of_year              = P.week_of_year
 AND L.route_name                = P.route_name
 AND L.route_id                  = P.route_id  
 AND L.delivery_point_ref_num    = P.delivery_point_ref_num
 
 FULL JOIN 
 (sel ---top 10 *
 cal.week_of_year, min (cal.calendar_date) as WC, max (cal.calendar_date) as WE,
 dagg.route_name, dagg.route_id, delivery_point_ref_num , sum(Volume) AS TRACKED
 from EDW_SCVER_CODA_ACCS_VIEWS.v_DP_DAILY_AGG dagg
 inner join SYS_CALENDAR.Calendar cal on dagg.delivery_date = cal.calendar_date
 and dagg.source_system IN ('TODS', 'RMGTT')
 and dagg.location_name_rln 
 IN (
 --'Northwood DO', 	
 'Ripley DE DO' ---, DE same?
 --'Plympton DO',
 --'Valley DO'
 )  
 Group by 1, 4, 5, 6 ) T
 
 ON  L.week_of_year              = T.week_of_year
 AND L.route_name                = T.route_name
 AND L.route_id                  = T.route_id  
 AND L.delivery_point_ref_num    = T.delivery_point_ref_num
 
 ;
 