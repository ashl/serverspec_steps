###
### Bridge
###

# 1 argument
step "bridge :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Bridge.new(v_arg)

  case v_cmd
  when "exist"
    expect(svspec).to exist
  else
    raise "unknown option : #{v_cmd}"
  end
end

# 2 argument
step "bridge :v_arg :v_cmd v_opt" do |v_arg, v_cmd, v_opt|
  svspec = Serverspec::Type::Bridge.new(v_arg)

  case v_cmd 
  when "have","have_interface"
    expect(svspec).to have_interface "#{v_opt}"
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
