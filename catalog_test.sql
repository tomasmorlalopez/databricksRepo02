-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## Catálogos
-- MAGIC **creación de catálogo test**
-- MAGIC
-- MAGIC **creación de tabla de ejemplo**
-- MAGIC
-- MAGIC

-- COMMAND ----------

-- DBTITLE 0,Celda 1
show catalogs

-- COMMAND ----------

-- Create a `test` catalog
CREATE CATALOG test COMMENT 'This catalog is used to raw information';

-- COMMAND ----------

-- Show schemas
USE CATALOG test;
SHOW SCHEMAS;


-- COMMAND ----------

CREATE SCHEMA if NOT exists test.schema1;


-- COMMAND ----------

--Schema properties
DESCRIBE SCHEMA EXTENDED test.schema1;


-- COMMAND ----------

-- Create table
CREATE TABLE if not exists test.schema1.table_example (column1 INT, column2 STRING);


-- COMMAND ----------

INSERT INTO test.schema1.table_example VALUES (1, 'nameA'), (2, 'nameB');


-- COMMAND ----------

select * from test.schema1.table_example

-- COMMAND ----------

DROP CATALOG test CASCADE;


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Creación de Catálogo en silver para DVDRental
-- MAGIC **Crear distintos esquemas según la naturaleza de las tablas**
-- MAGIC
-- MAGIC Tres esquemas:
-- MAGIC 1. customer
-- MAGIC 1. inventory
-- MAGIC 1. rental
-- MAGIC

-- COMMAND ----------

-- Create a `silver` catalog
CREATE CATALOG silver COMMENT 'This catalog is used to validated information';

-- COMMAND ----------

--Create the schemas;
create schema if not exists silver.customer;
create schema if not exists silver.inventory;
create schema if not exists silver.rental;


-- COMMAND ----------

select * from silver.inventory.actor

-- COMMAND ----------

DROP CATALOG silver CASCADE;

-- COMMAND ----------

DROP CATALOG gold CASCADE;
