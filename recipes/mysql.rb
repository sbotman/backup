template "#{node[:backup][:dir]}/models/mysql.rb" do
  source "mysql-model.rb.erb"
  mode "0664"
  owner "root"
  group "root"
end

template "#{node[:backup][:dir]}/schedules/mysql-backup.rb" do
  source "schedule.rb.erb"
  mode "0664"
  owner "root"
  group "root"

  variables(
    :interval => node[:backup][:mysql][:interval],
    :trigger  => "mysql"
  )
end

execute "update crontab via whenever" do
  command "whenever --update-crontab mysql-backup --load-file #{node[:backup][:dir]}/schedules/mysql-backup.rb"
end