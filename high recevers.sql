 
sel  * from edw_Scver_coda_accs_views.v_location
where location_name_rln like 'NORTHWOOD%' or 
location_name_rln like 'Northwood%';

sel * from edw_Scver_bo_views.v_route_delivery_schedule
where 
delivery_route_id = '%6451%'

;


sel distinct route_owner_location_id from 
edw_Scver_bo_views.v_route where
route_owner_location_id in (
6451,
968063,
6452,
6450,
713417,
713936,
714918,
977852,
718271,
714125  );


sel * from
EDW_SCVER_CODA_ACCS_VIEWS.v_DP_DAILY_AGG
where location_name_rln = 'Northwood DO';


