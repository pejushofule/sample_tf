# when you run terraform init, it will create a .terraform folder and install
# the provider you requested in that folder
#also, it creates a lock file to lock down the version


#specifying which terraform provider i want use. e.g Snowflake, Azure, AWS, GCP etc

terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
    }
  }
}

#you will give the details to log into that particular provider
provider "snowflake" {
  organization_name = "TSVCGXJ"
  account_name      = "PEJU"
  user              = "peju_tf"
  role              = var.role
  password          = var.pwd

}

variable "role" {

}


variable "pwd" {
}


#You declare the resources you want to create

resource "snowflake_database" "lizzy_db" {
  name    = "LIZZY"
  comment = "I love you"
}


resource "snowflake_database" "aor_db" {
  name = "AOR_DB"

}



resource "snowflake_schema" "aor_schema" {
  database = snowflake_database.aor_db.name
  name     = "AOR_db_SCHEMA"
}









