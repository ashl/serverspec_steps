###
### Service
###

# 1 argument
step "service :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Service.new(v_arg)

  case v_cmd
  when "enabled", "be_enabled"
    expect(svspec).to be_enabled
  when "disabled", "be_disabled"
    expect(svspec).not_to be_enabled
  when "installed", "be_installed"
    expect(svspec).to be_installed
  when "running", "be_running"
    expect(svspec).to be_running
  when "stopping", "be_stopping", "not_running"
    expect(svspec).not_to be_running
  else
    raise "unknown option : #{v_cmd}"
  end
end

# 2 argument
step "service :v_arg :v_cmd :v_opt" do |v_arg, v_cmd, v_opt|
  svspec = Serverspec::Type::Service.new(v_arg)

  case v_cmd 
  when "be_monitored_by", "monitored"
    expect(svspec).to be_monitored_by "#{v_opt}"
  when "have_start_mode"
    expect(svspec).to have_start_mode "#{v_opt}"
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
