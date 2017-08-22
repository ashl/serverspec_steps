###
### Process
###

# 1 argument
step "process :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Process.new(v_arg)

  case v_cmd
  when "running", "be_running"
    expect(svspec).to exist
  else
    raise "unknown option : #{v_cmd}"
  end
end

# 2 argument
step "process :v_arg :v_cmd v_opt" do |v_arg, v_cmd, v_opt|
  svspec = Serverspec::Type::Process.new(v_arg)

  case v_cmd 
  when "count"
    expect(svspec.count).to eq v_opt.to_i
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
