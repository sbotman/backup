def initialize(*args)
  super
  @action = :create
end

action :create do
  template "#{node[:backup][:dir]}/models/#{new_resource.label}.rb" do
    cookbook "backup"
    source "mysql-model.rb.erb"
    mode "0664"
    owner "root"
    group "root"

    variables(
      :label              => new_resource.label,
      :chunks             => new_resource.chunks,
      :database           => new_resource.database,
      :username           => new_resource.username,
      :password           => new_resource.password,
      :host               => new_resource.host,
      :port               => new_resource.port,
      :socket             => new_resource.socket,
      :skip_tables        => new_resource.skip_tables,
      :only_tables        => new_resource.only_tables,
      :additional_options => new_resource.additional_options,

      :cloudfiles            => new_resource.storage == "cloudfiles",
      :cloudfiles_api_key    => new_resource.cloudfiles_api_key,
      :cloudfiles_username   => new_resource.cloudfiles_username,
      :cloudfiles_password   => new_resource.cloudfiles_password,
      :cloudfiles_container  => new_resource.cloudfiles_container,
      :cloudfiles_path       => new_resource.cloudfiles_path,
      :cloudfiles_keep       => new_resource.cloudfiles_keep,
      :cloudfiles_auth_url   => new_resource.cloudfiles_auth_url,
      :cloudfiles_servicenet => new_resource.cloudfiles_servicenet
    )
  end

  template "#{node[:backup][:dir]}/schedules/#{new_resource.label}-backup.rb" do
    cookbook "backup"
    source "schedule.rb.erb"
    mode "0664"
    owner "root"
    group "root"

    variables(
      :interval => new_resource.interval,
      :run_at   => new_resource.run_at,
      :trigger  => new_resource.label
    )
  end

  execute "update crontab via whenever for #{new_resource.label}" do
    command "whenever --update-crontab #{new_resource.label} --load-file #{node[:backup][:dir]}/schedules/#{new_resource.label}-backup.rb"
  end
end