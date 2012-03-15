# Description

Uses the `backup` ruby gem for creating backups

Supports mysql backups to cloudfiles.
Support for mongodb to cloudfiles coming next.

## Usage

Minimal options to get going.

``` ruby
backup_mysql "myapp-mysql" do
  # chunks 250
  # interval "1.day", :at => "12:00 am"

  # To dump all databases, set database = :all (or leave blank)
  database "myapp_production"
  username "my_username"
  password "my_password"
  host "localhost"

  storage "cloudfiles"
  cloudfiles_api_key "my_api_key"
  cloudfiles_username "my_username"
  cloudfiles_container "my_container"
end
```

## Notes

* make sure to add depends on referring project cookbook
* add to mongo or mysql recipe in project cookbook:
```ruby
# Only run database backup recipe on primary database node                                                                                                                                                                                                                                                  
if node.name =~ /01$/
  Chef::Log.info "Running database backup recipe"
    include_recipe "target-tgtapps::database-backup"
	end
```
