###
### Host
###

# 1 argument
step "host :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Host.new(v_arg)

  case v_cmd
  when "resolvable", "be_resolvable"
    expect(svspec).to be_resolvable
  when "reachable", "be_reachable"
    expect(svspec).to be_reachable
  else
    raise "unknown option : #{v_cmd}"
  end
end

# 2 argument
step "host :v_arg :v_cmd v_opt" do |v_arg, v_cmd, v_opt|
  svspec = Serverspec::Type::Host.new(v_arg)

  case v_cmd 
  when "have","have_interface"
    expect(svspec).to have_interface "#{v_opt}"
  when "reachable", "be_reachable"
    expect(svspec).to be_reachable.with( :port => v_opt.to_i )
  when "is", "resolve", "resolvable", "be_resolvable"
    expect(svspec.ipaddress).to eq v_opt
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
