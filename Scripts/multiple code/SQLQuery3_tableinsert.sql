exec bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '================================================'; 

		SET @start_time = GETDATE();
			truncate table bronze.crm_cust_info;
			bulk insert bronze.crm_cust_info
			from 'L:\Datawarehouse_projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
			with(
				firstrow = 2,
				fieldterminator = ',',
				tablock
			);
			SET @end_time = GETDATE();
PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';


SET @start_time = GETDATE();
		truncate table bronze.crm_prd_info;
		bulk insert bronze.crm_prd_info
		from 'L:\Datawarehouse_projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';


SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_details';
truncate table bronze.crm_sales_details;
bulk insert bronze.crm_sales_details
from 'L:\Datawarehouse_projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

PRINT 'Loading ERP Tables';

SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_cust_az12';
truncate table bronze.erp_cust_az12;
bulk insert bronze.erp_cust_az12
from 'L:\Datawarehouse_projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_loc_a101';
truncate table bronze.erp_loc_a101;
bulk insert bronze.erp_loc_a101
from 'L:\Datawarehouse_projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
truncate table bronze.erp_px_cat_g1v2;
bulk insert bronze.erp_px_cat_g1v2
from 'L:\Datawarehouse_projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

SET @batch_end_time = GETDATE();

PRINT '=========================================='
		PRINT 'Loading Bronze Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '=========================================='
	END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END