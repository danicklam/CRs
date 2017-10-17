/*MAXDATE*/
sel max (event_date),min (event_date)
 FROM
MgrS_TRAFFIC.MEARS_TRAFFIC_COUNT_JS; --2016-10-18, 2016-08-01

sel max (event_date),min (event_date)
 FROM
 MgrS_TRAFFIC.mears_traffic_count_tp; --2016-08-05, 2016-08-01

sel max (delivery_dt),min (delivery_dt)
 FROM
 MgrS_TRAFFIC.parcel_high_receivers_tp; --2016-09-20, 2016-06-16

sel max (delivery_dt),min (delivery_dt)
 FROM
 MgrS_TRAFFIC.TODS_HIGH_RECEIVERS_TP; --2016-09-15, 2016-06-16


 
 /*COUNTS*/
 sel count (*)
 FROM
 MgrS_TRAFFIC.MEARS_TRAFFIC_COUNT_JS; --8,076,482
 sel count (*)
 FROM
 MgrS_TRAFFIC.mears_traffic_count_tp; --1,832,511,245
 sel count (*)
 FROM
 MgrS_TRAFFIC.parcel_high_receivers_tp; --74,755,312
 sel count (*)
 FROM
 MgrS_TRAFFIC.TODS_HIGH_RECEIVERS_TP; --25,194,060
