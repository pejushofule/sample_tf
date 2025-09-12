#Import the Session class.
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
}

#create a session object

session = Session.builder.configs(connection_parameters).create()

#import data into a dataframe using the session object just created
# df = session.table or df = session.database.schema.table

df = session.table("OLAPEJU_DB.PUBLIC.PJ_NEW") 
#df.show()

#create a new dataframe that consist the old dataframe plus a new conditional column to check if the email is invalid
df_with_email2 = df.with_column(
    "EMAIL_ADDRESS2",
    when(
        (col('"EMAIL_ADDRESS"').is_not_null()) & (~col('"EMAIL_ADDRESS"').like('%@%')),
        lit(None)   # set invalid email to NULL
    ).otherwise(col('"EMAIL_ADDRESS"'))
)

#Write the cleaned data frame into a new table
df_with_email2.write.save_as_table("cleaned_email", mode="overwrite")