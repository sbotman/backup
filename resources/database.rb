actions :create

attribute :label, :kind_of => String, :name_attribute => true, :regex => /[0-9a-zA-Z_-]+/

attribute :chunks, :kind_of => Integer, :default => 250

# These values are passed through to whenever's `every` method:
# every "1.day", :at => "12:00 am"
# https://github.com/javan/whenever
attribute :interval, :default => "1.day"
attribute :run_at, :default => "12:00 am"

attribute :database, :kind_of => String, :required => true

# To dump all databases, set database_name = :all (or leave blank)
attribute :mysql_database_name, :kind_of => [ String, FalseClass ]
attribute :mysql_username, :kind_of => String, :required => true
attribute :mysql_password, :kind_of => String, :required => true
attribute :mysql_host, :kind_of => String, :default => "localhost"
attribute :mysql_port, :kind_of => Integer, :default => 3306
attribute :mysql_socket, :kind_of => String, :default => "/tmp/mysql.sock"
attribute :mysql_skip_tables, :kind_of => [ Array, FalseClass ], :default => false # ["skip", "these", "tables"]
attribute :mysql_only_tables, :kind_of => [ Array, FalseClass ], :default => false # ["only", "these" "tables"]
attribute :mysql_additional_options, :kind_of => [ Array, FalseClass ], :default => ["--quick", "--single-transaction"]

# To dump all databases, set database_name = :all (or leave blank)
attribute :mongodb_database_name, :kind_of => [ String, FalseClass ]
attribute :mongodb_username, :kind_of => String
attribute :mongodb_password, :kind_of => String
attribute :mongodb_host, :kind_of => String, :default => "localhost"
attribute :mongodb_port, :kind_of => Integer, :default => 27017
attribute :mongodb_ipv6, :kind_of => FalseClass, :default => false
attribute :mongodb_only_collections, :kind_of => [ Array, FalseClass ], :default => false # ["only", "these" "tables"]
attribute :mongodb_additional_options, :kind_of => [ Array, FalseClass ], :default => false 
attribute :mongodb_lock, :kind_of => FalseClass, :default => false

attribute :storage, :equal_to => [ "cloudfiles", "s3" ]
attribute :cloudfiles_api_key, :kind_of => String
attribute :cloudfiles_username, :kind_of => String
attribute :cloudfiles_password, :kind_of => String
attribute :cloudfiles_container, :kind_of => String
attribute :cloudfiles_path, :kind_of => String, :default => "/backups"
attribute :cloudfiles_keep, :kind_of => Integer, :default => 7
attribute :cloudfiles_auth_url, :kind_of => String, :default => "https://auth.api.rackspacecloud.com"
attribute :cloudfiles_servicenet, :kind_of => [ TrueClass, FalseClass ], :default => true
