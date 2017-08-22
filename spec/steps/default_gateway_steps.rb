###
### Default_gateway
###

# 1 argument
step "default_gateway :v_cmd :v_arg" do |v_cmd, v_arg|
  svspec = Serverspec::Type::Default_gateway.new()

  case v_cmd
  when "ipaddress", "ip"
    expect(svspec.ipaddress).to eq v_arg
  when "interface"
    expect(svspec.interface).to eq v_arg
  else
    raise "unknown option : #{v_cmd}"
  end
end
