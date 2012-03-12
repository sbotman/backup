actions :create

attribute :label, :kind_of => String, :name_attribute => true, :regex => /[0-9a-zA-Z_-]+/

attribute :chunks, :kind_of => Integer, :default => 250

# These values are passed through to whenever's `every` method:
# every "1.day", :at => "12:00 am"
# https://github.com/javan/whenever
attribute :interval, :default => "1.day"
attribute :run_at, :default => "12:00 am"

# To dump all databases, set database = :all (or leave blank)
attribute :database, :kind_of => [ String, FalseClass ]
attribute :username, :kind_of => String, :required => true
attribute :password, :kind_of => String, :required => true
attribute :host, :kind_of => String, :default => "localhost"
attribute :port, :kind_of => Integer, :default => 3306
attribute :socket, :kind_of => String, :default => "/tmp/mysql.sock"
attribute :skip_tables, :kind_of => [ Array, FalseClass ], :default => false # ["skip", "these", "tables"]
attribute :only_tables, :kind_of => [ Array, FalseClass ], :default => false # ["only", "these" "tables"]
attribute :additional_options, :kind_of => [ Array, FalseClass ], :default => ["--quick", "--single-transaction"]

attribute :storage, :equal_to => [ "cloudfiles", "s3" ]
attribute :cloudfiles_api_key, :kind_of => String
attribute :cloudfiles_username, :kind_of => String
attribute :cloudfiles_container, :kind_of => String
attribute :cloudfiles_path, :kind_of => String, :default => "/backups"
attribute :cloudfiles_keep, :kind_of => Integer, :default => 7
attribute :cloudfiles_auth_url, :kind_of => String, :default => "https://auth.api.rackspacecloud.com"
attribute :cloudfiles_servicenet, :kind_of => [ TrueClass, FalseClass ], :default => true
