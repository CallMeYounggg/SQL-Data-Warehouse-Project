/* 
============================================
Quality Checks
============================================
Script Purpose:
  This script performs various quality checks for data consistency, accuracy,
  and standardization across the silver schemas. It includes checks for:
    - Null or duplicate primary keys
    - Unwanted spaces in the string fields
    - Data standardization and consistency
    - Invalid date ranges and orders
    - Data consistency between related fields

Usage notes: 
    - Run these checks after loading silver layer
    - Investigate and resolve any discrepancies found during the checks
============================================
*/

-- =========================================
-- Checking 'silver.erp_CUST_AZ12
--==========================================
-- Identify out-of-range dates
-- Expectations: No results

SELECT DISTINCT
bdate
FROM silver.erp_CUST_AZ12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()

--Data standardization and consistency
SELECT DISTINCT 
gen,
CASE WHEN UPPER(TRIM(gen)) IN ('F', 'FEMALE') THEN 'Female'
	WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN 'Male'
	ELSE 'N/A'
END AS gen

FROM silver.erp_CUST_AZ12

SELECT *
FROM silver.erp_cust_az12

-- =========================================
-- Checking 'silver.erp_LOC_A101
--==========================================
-- Data standardization and consistency

SELECT DISTINCT cntry

FROM silver.erp_LOC_A101
ORDER BY cntry

SELECT *
FROM silver.erp_LOC_A101

-- =========================================
-- Checking 'silver.erp_PX_CAT_G1V2'
--==========================================
-- Check for unwanted spaces
-- Expectations: No result
SELECT * FROM silver.erp_PX_CAT_G1V2
WHERE CAT != TRIM(CAT) OR SUBCAT != TRIM(SUBCAT) OR MAINTENANCE != TRIM(MAINTENANCE)

-- Data standardization and consistency
SELECT DISTINCT
CAT FROM silver.erp_PX_CAT_G1V2

SELECT DISTINCT
SUBCAT FROM silver.erp_PX_CAT_G1V2

SELECT DISTINCT
MAINTENANCE FROM silver.erp_PX_CAT_G1V2

SELECT *
FROM silver.erp_PX_CAT_G1V2
