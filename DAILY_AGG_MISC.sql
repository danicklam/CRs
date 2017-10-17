SELECT pe.event_id, postal_event_type_id 
FROM  EDW_SCVER_BO_VIEWS.v_postal_event pe 
	WHERE 1=1
	AND pe.POSTAL_EVENT_TYPE_ID IN(0,12)
	and event_id in (select event_id from MgrS_LAM.PARTY_EVENT_RMGTT );
	
	
	COLLECT STATISTICS COLUMN(event_id) ON MgrS_LAM.PARTY_EVENT_RMGTT;
	
	
	
select distinct (delivery_office)  
from EDW_SCVER_CODA_DIM_VIEWS.v_dim_address_ops_hierarchy 
where delivery_office IN (
			'Abingdon DO',
			'Alloa DO',
			'Andover DO',
			'Ashtead DO',
			'Ballymena DO',
			'Banbury DO',
			'Barnsley DO',
			'Bearsden DO',
			'Belfast BT15 DO',
			'Berkhamsted DO',
			'Bilston DO',
			'Blackpool DO',
			'Bracknell DO',
			'Bridgwater DO',
			'Bristol South DO',
			'Bude DO',
			'Burton On Trent DO',
			'Bury St Edmunds DO',
			'Cambridge DO',
			'Cardiff North DO',
			'Chelmsford DO',
			'Chester DO',
			'Clacton On Sea DO',
			'Colchester DO',
			'Coventry North DO',
			'Crewkerne DO',
			'Dalkeith DO',
			'Deptford DO',
			'Dover DO',
			'Dundee Central DO',
			'East Grinstead DO',
			'Edinburgh East DO',
			'Enniskillen DO',
			'Fareham DO',
			'Fordingbridge DO',
			'Gainsborough DO',
			'Glasgow G13 and G14 DO',
			'Glenrothes DO',
			'Great Missenden DO',
			'Halstead DO',
			'Harrow North and South DO',
			'Hayes DO',
			'Helston DO',
			'High Wycombe North DO',
			'Holyhead DO',
			'Hucknall DO',
			'Ilkeston DO',
			'Islington DO',
			'Iver DO',
			'Keswick DO',
			'Kingsbridge DO',
			'Kittybrewster DO',
			'Largs DO',
			'Leicester South DO',
			'Leyburn DO',
			'Liverpool 8 DO',
			'Llantwit Major DO',
			'Loughborough DO',
			'Maidenhead DO',
			'Manchester Central DO',
			'Marlow DO',
			'Mildenhall DO',
			'Montrose DO',
			'Mount Pleasant EC1 DO',
			'Nailsea DO',
			'Newark DO',
			'Newton Aycliffe DO',
			'Northampton NN3A DO',
			'Nottingham North DO',
			'Orpington DO',
			'Oxford East DO',
			'Patchway DO',
			'Petersfield DO',
			'Pontefract DO',
			'Portsmouth DO',
			'Pulborough DO',
			'Reading DO',
			'Ringwood DO',
			'Royston DO',
			'Sandhurst DO',
			'Seaton DO',
			'Sheffield West DO',
			'Skelmersdale DO',
			'Slough DO',
			'Southend On Sea DO',
			'St Albans DO',
			'Steyning DO',
			'Streatham DO',
			'Sutton DO',
			'Swindon DO',
			'Swindon West DO',
			'Tewkesbury DO',
			'Tong Road DO',
			'Turriff DO',
			'Wallingford DO',
			'Wembley Lows DO',
			'Westhill DO',
			'Wimbledon DO',
			'Worcester DO',
			'Ystalyfera DO',
			'Harrow DO'

			);
			
			
			
SEL DISTINCT (DELIVERY_OFFICE) FROM 
EDW_SCVER_CODA_DIM_VIEWS.v_dim_address_ops_hierarchy 
WHERE DELIVERY_OFFICE LIKE 
--'%Harrow%'
--,
--'%Holy%'
--'Iver%'
'Liverpool%'
--'Llantwit Major DO',
--'Northampton NN3A DO',
--'Steyning DO',
--'Wembley Lows DO',
--'Ystalyfera DO'
;
