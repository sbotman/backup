%w[ backup fog mail whenever ].each do |gem_name|
  gem_package gem_name
end

%w[ models schedule ].each do |dir|
  directory "#{node[:backup][:dir]}/#{dir}" do
    mode "0775"
    owner "root"
    group "root"
    recursive true
  end
end

template "#{node[:backup][:dir]}/client.rb" do
  source "config.rb.erb"
  mode "0664"
  owner "root"
  group "root"
end
