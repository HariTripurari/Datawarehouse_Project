truncate table bronze.crm_cust_info;
bulk insert bronze.crm_cust_info
from 'L:\Datawarehouse_projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
);



truncate table bronze.crm_prd_info;
bulk insert bronze.crm_prd_info
from 'L:\Datawarehouse_projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
);


truncate table bronze.crm_sales_details;
bulk insert bronze.crm_sales_details
from 'L:\Datawarehouse_projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
);

truncate table bronze.erp_cust_az12;
bulk insert bronze.erp_cust_az12
from 'L:\Datawarehouse_projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
);

truncate table bronze.erp_loc_a101;
bulk insert bronze.erp_loc_a101
from 'L:\Datawarehouse_projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
);

truncate table bronze.erp_px_cat_g1v2;
bulk insert bronze.erp_px_cat_g1v2
from 'L:\Datawarehouse_projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
);