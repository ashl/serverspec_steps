###
### Interface
###

# 1 argument
step "interface :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Interface.new(v_arg)

  case v_cmd
  when "exist"
    expect(svspec).to exist
  when "up", "be_up"
    expect(svspec).to be_up
  else
    raise "unknown option : #{v_cmd}"
  end
end

# 2 argument
step "interface :v_arg :v_cmd v_opt" do |v_arg, v_cmd, v_opt|
  svspec = Serverspec::Type::Interface.new(v_arg)

  case v_cmd 
  when "speed"
    expect(svspec.speed).to eq v_opt
  when "ip", "have", "have_ipv4_address"
    expect(svspec).to have_ipv4_address(v_opt)
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
