# [START cloud_sql_mysql_create_instance]
resource "google_sql_database_instance" "mysql_instance_name" {
  name = "techcasts-sql-database-instance"
  region = "asia-southeast1"
  database_version = "MYSQL_8_0"
  root_password = "abcABC123!"

  settings {
    tier = "db-f1-micro"
    password_validation_policy {
      min_length = 6
      complexity = "COMPLEXITY_DEFAULT"
      reuse_interval = 2
      disallow_username_substring = true
      enable_password_policy = true
    }
  }

  deletion_protection = true # set to true to prevent destruction 
  # of the resource
}

# [END cloud_sql_mysql_create_instance]

# [START cloud_sql_mysql_create_database]
resource "google_sql_database" "database" {
  name = "echcasts-sql-database-instance"
  instance = google_sql_database_instance.instance.name
}
# [END cloud_sql_mysql_create_database]