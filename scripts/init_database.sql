/*
=============================================
Create Database and Schemas
=============================================
Script purpose:
      This script creates a new datababse name 'DataWarehouse'. This script also sets up three schemas within
      the database: 'bronze', 'silver', and 'gold'.
/*

-- Create database 'DataWarehouse'

USE master;

CREATE DATABASE DataWarehouse;

USE DataWarehouse;

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;

