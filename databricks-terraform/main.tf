terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "0.3.7" # Specify the required version
    }
  }
}

provider "databricks" {
  host  = "https://dbc-7a1309f0-bff0.cloud.databricks.com/"
  token = var.databricks_token
}

resource "databricks_cluster" "cluster" {
  cluster_name            = "lino-cluster"
  spark_version           = "13.3.x-scala2.12"
  node_type_id            = "m5d.large"
  autotermination_minutes = 20
  autoscale {
    min_workers = 1
    max_workers = 2
  }
}
