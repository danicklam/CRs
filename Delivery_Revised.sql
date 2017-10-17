sel top 1000 * from
EDW_SCVER_CODA_DIM_VIEWS.v_dim_address
--EDW_SCVER_CODA_ACCS_VIEWS.v_location_address
--EDW_SCVER_CODA_ACCS_VIEWS.v_location_dimaddress_xref
--EDW_SCVER_CODA_ACCS_VIEWS.v_location_hierarchy_current
;
 
 
sel * from EDW_SCVER_CODA_ACCS_VIEWS.v_route_delivery_schedule
where delivery_route_id = 1110656;
 
sel distinct (route_id) from EDW_SCVER_CODA_ACCS_VIEWS.v_route
where route_owner_location_id in ( 6451)
;
 
sel count (*), count (distinct point_address_id) from 
EDW_SCVER_CODA_ACCS_VIEWS.v_route_delivery_schedule rds
inner join  EDW_SCVER_CODA_ACCS_VIEWS.v_route r 
on r.route_id = rds.delivery_route_id
and r.route_id = 6451
 ;
 
sel * from EDW_SCVER_CODA_ACCS_VIEWS.v_location
--where location_name_rln = 'Northwood DO'
where 1=1
and location_id between 6450 and 6500
;
 
sel top 100 * from EDW_SCVER_CODA_DIM_VIEWS.v_dim_address_ops_hierarchy;
 
show view EDW_SCVER_CODA_DIM_VIEWS.v_dim_address_ops_hierarchy;
 
show table EDW_SCVER.ADDRESS_OPS_HIERARCHY;

sel top 10 * from 
edw_scver_coda_accs_views.v_DELIVERY_POINT_ADDRESS ; 

sel * from 
edw_scver_bo_views.v_ROUTE_DELIVERY_SCHEDULE  RDS
INNER JOIN edw_scver_bo_views.v_ROUTE R     ------ sel top 10 * from  edw_scver_coda_accs_views.v_ROUTE
ON RDS.DELIVERY_ROUTE_ID = R.ROUTE_ID
INNER JOIN edw_scver_coda_accs_views.v_LOCATION LOC
ON R.ROUTE_OWNER_LOCATION_ID = LOC.LOCATION_ID
AND LOC.LOCATION_ID = 6451;



sel
--a.Event_Actual_Dt as Delivery_Date,
cal.week_of_year,
LOC.LOCATION_NAME_RLN  AS Delivery_Office,
RDS.DELIVERY_ROUTE_ID AS Route_Id ,
R.ROUTE_NUM AS Route_Name,
c.Postcode_Area,
c.Postcode_District,
c.Postcode_Sector,
c.Postcode_Unit,
--DST.Data_Source_Type_Desc as Source_System,
ppt.Postal_Piece_Type_Desc,
Min(a.event_actual_dt),
COUNT (DISTINCT a.piece_id ) as Volume
--, max(
--case when p.product_name in ('Signed For','Philatelic Signed For','BSS Signed For','Recorded Signed For Desp Exp','Recorded Delivery','Royal Mail Signed For 1c/2c') or 
--p.product_cat_1 in ('Special Delivery 0900','Special Delivery Next Day','Special Delivery with Response Services') then 1 else 0 end
--) as Signature_Required_Ind
from edw_scver_coda_accs_views.v_event_party a                --- sel top 10 * from edw_scver_coda_accs_views.v_event_party
inner join edw_scver_coda_accs_views.v_party_address b     --- sel top 10 * from edw_scver_coda_accs_views.v_party_address
on a.party_id=b.party_id
and b.address_type_id = 1
and a.event_party_role_id = 1
and a.data_source_type_id IN (8)
and a.event_actual_dt between date '2017-06-01' and date '2017-06-30'
inner join SYS_CALENDAR.Calendar cal
on cal.calendar_date = a.event_actual_dt
and cal.year_of_calendar = 2017
and cal.month_of_year = 6
inner join edw_scver_coda_dim_views.v_dim_address c          --- sel top 10 * from edw_scver_coda_dim_views.v_dim_address
on b.address_id=c.Address_Id
inner join edw_scver_coda_accs_views.v_shipper_piece d         --- sel top 10 * from edw_scver_coda_accs_views.v_shipper_piece
on a.piece_id=d.piece_id
inner join edw_scver_coda_accs_views.v_postal_piece_type ppt     --- sel top 10 * from edw_scver_coda_accs_views.v_postal_piece_type
on d.postal_piece_type_id=ppt.postal_piece_type_id
inner join edw_scver_coda_accs_views.v_DELIVERY_POINT_ADDRESS  DPA     --- sel top 10 * from edw_scver_coda_accs_views.v_DELIVERY_POINT_ADDRESS
ON c.DELIVERY_POINT_SUFFIX_VAL = DPA.Delivery_Point_Suffx_Val
AND C.POSTCODE_AREA   = DPA.POSTCODE_AREA_VAL
AND C.POSTCODE_DISTRICT   = DPA.POSTCODE_DISTRICT_VAL
AND C.POSTCODE_SECTOR   = DPA.POSTCODE_SECTOR_VAL
AND C.POSTCODE_UNIT   = substr(DPA.POSTCODE, Character(DPA.POSTCODE) -2)
--AND OREPLACE (c.POSTCODE,' ','')=OREPLACE (DPA.POSTCODE,' ','')
INNER JOIN edw_scver_coda_accs_views.v_ROUTE_DELIVERY_SCHEDULE  RDS     --- sel top 10 * from edw_scver_coda_accs_views.v_ROUTE_DELIVERY_SCHEDULE
ON DPA.POINT_ADDRESS_ID = RDS.POINT_ADDRESS_ID
--AND RDS.ROUTE_DP_DEL_IND=0  
--AND DPA.Delivery_Point_Del_Ind = 0 
INNER JOIN edw_scver_coda_accs_views.v_ROUTE R
ON RDS.DELIVERY_ROUTE_ID = R.ROUTE_ID
INNER JOIN edw_scver_coda_accs_views.v_LOCATION LOC    --- sel top 10 * from edw_scver_coda_accs_views.v_LOCATION
ON R.ROUTE_OWNER_LOCATION_ID = LOC.LOCATION_ID
AND LOC.LOCATION_ID = 6451
left outer join edw_scver_bo_views.v_product p          --- sel top 10 * from edw_scver_bo_views.v_product
on d.item_id = p.product_id
group by 1,2,3,4,5,6,7,8,9
;
----
sel calendar_date, day_of_week, week_of_year, year_of_calendar from 
SYS_CALENDAR.Calendar
where year_of_calendar = 2017
and month_of_year = 6;



sel top 10 * from
edw_scver_coda_accs_views.v_event_party
;


sel dpa.point_address_id, c.postcode

from edw_scver_coda_accs_views.v_event_party a
inner join edw_scver_coda_accs_views.v_party_address b
on a.party_id=b.party_id
and a.event_actual_dt between date '2017-06-01' and date '2017-06-02'
inner join edw_scver_coda_accs_views.v_data_source_type DST
on a.data_source_type_id = DST.data_source_type_id
inner join edw_scver_coda_dim_views.v_dim_address c
on b.address_id=c.Address_Id
inner join edw_scver_coda_accs_views.v_shipper_piece d
on a.piece_id=d.piece_id
inner join edw_scver_coda_accs_views.v_postal_piece_type ppt
on d.postal_piece_type_id=ppt.postal_piece_type_id
inner join edw_scver_coda_accs_views.v_DELIVERY_POINT_ADDRESS  DPA
ON c.DELIVERY_POINT_SUFFIX_VAL=DPA.Delivery_Point_Suffx_Val
AND OREPLACE (c.POSTCODE,' ','')=OREPLACE (DPA.POSTCODE,' ','')
INNER JOIN edw_scver_coda_accs_views.v_ROUTE_DELIVERY_SCHEDULE  RDS
ON DPA.POINT_ADDRESS_ID = RDS.POINT_ADDRESS_ID
AND RDS.ROUTE_DP_DEL_IND=0  
AND DPA.Delivery_Point_Del_Ind = 0 
INNER JOIN edw_scver_coda_accs_views.v_ROUTE R
ON RDS.DELIVERY_ROUTE_ID = R.ROUTE_ID
INNER JOIN edw_scver_coda_accs_views.v_LOCATION LOC
ON R.ROUTE_OWNER_LOCATION_ID = LOC.LOCATION_ID
AND LOC.LOCATION_ID = 6451
;



