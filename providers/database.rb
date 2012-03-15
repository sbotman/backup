def initialize(*args)
  super
  @action = :create
end

action :create do
  template "#{node[:backup][:dir]}/models/#{new_resource.label}.rb" do
    cookbook "backup"
    source "database-model.rb.erb"
    mode "0664"
    owner "root"
    group "root"

    variables(
      :resource => new_resource
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