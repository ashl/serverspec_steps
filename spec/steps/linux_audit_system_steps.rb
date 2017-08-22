###
### Linux_audit_system
###

# 1 argument
step "linux_audit_system :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Linux_audit_system.new(v_arg)

  case v_cmd
  when "running", "be_running"
    expect(svspec).to be_running
  when "enabled", "be_enabled"
    expect(svspec).to be_enabled
  else
    raise "unknown option : #{v_cmd}"
  end
end

# 2 argument
step "linux_audit_system :v_arg :v_cmd v_opt" do |v_arg, v_cmd, v_opt|
  svspec = Serverspec::Type::Linux_audit_system.new(v_arg)

  case v_cmd 
  when "rules"
    expect(svspec.rules).to include v_opt
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
