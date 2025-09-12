from snowflake.snowpark import Session
from snowflake.snowpark.functions import col, lit, when

connection_parameters = {
    "account": "TSVCGXJ-PEJU",
    "user": "PEJU",
    "password": "OYindamola2025$",
    "role": "SYSADMIN",
    "warehouse": "PEJU_WH",
    "database": "OLAPEJU_DB",
    "schema": "PUBLIC"





CREATE OR REPLACE TABLE betty_table (
  surrogate_id NUMBER IDENTITY(01,1),
  first_name STRING,
  last_name STRING,
  age INT
);

INSERT INTO betty_table (first_name, last_name, age)
VALUES 
  ('Olapeju', 'Shofule', 40), ('Olu', 'Jonathan' 46),
  ('Kemi', 'Bademoh', 40),
  ('Folashade', 'Jemila', 53);

  Select * from Betty_table;git add