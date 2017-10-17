 sel 
 --top 10 * 
 cal.week_of_year, 
 dagg.delivery_date,
 dagg.Location_name_rln,
dagg.route_name, dagg.route_id,   
dagg.postal_piece_type_desc, 
count (distinct dagg.delivery_point_ref_num),
 sum (volume)
 from
 EDW_SCVER_CODA_ACCS_VIEWS.v_DP_DAILY_AGG dagg
 
 inner join
 SYS_CALENDAR.Calendar cal
 on dagg.delivery_date = cal.calendar_date
 and dagg.source_system = 'MEARS-ADF'
 and dagg.location_name_rln = 'Northwood DO'
group by 1,2,3,4,5,6
 ;
 
 
 sel  dagg.location_name_rln , count (*) from
 EDW_SCVER_CODA_ACCS_VIEWS.v_DP_DAILY_AGG dagg
 inner join
 SYS_CALENDAR.Calendar cal
 on dagg.delivery_date = cal.calendar_date
 and dagg.source_system = 'MEARS-ADF'
 and dagg.location_name_rln 
 IN (
 'Northwood DO', 	
 'Ripley DE DO', --- DE same?
 'Plympton DO',
 'Valley DO')   --- can't find
 group by 1
 ;
 
 
 
 
 
 
 
 sel distinct (location_name_rln) from
 EDW_SCVER_CODA_ACCS_VIEWS.v_DP_DAILY_AGG
;
 
 
 sel top 10 * from 
-- edw_scver_coda_accs_views.v_ROUTE_DELIVERY_SCHEDULE  ;
  edw_scver_coda_accs_views.v_LOCATION ;