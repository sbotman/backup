default[:backup][:mysql][:chunks]             = 250
default[:backup][:mysql][:interval]           = "1.day"

# To dump all databases, set database = :all (or leave blank)
default[:backup][:mysql][:database]           = "my_database_name"
default[:backup][:mysql][:username]           = "my_username"
default[:backup][:mysql][:password]           = "my_password"
default[:backup][:mysql][:host]               = "localhost"
default[:backup][:mysql][:port]               = 3306
default[:backup][:mysql][:socket]             = "/tmp/mysql.sock"
default[:backup][:mysql][:skip_tables]        = false # ["skip", "these", "tables"]
default[:backup][:mysql][:only_tables]        = false # ["only", "these" "tables"]
default[:backup][:mysql][:additional_options] = ["--quick", "--single-transaction"]
