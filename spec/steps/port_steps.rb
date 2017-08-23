###
### Port
###

# 1 argument
step "port :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Port.new(v_arg)

  case v_cmd
  when "listen", "listening", "be_listening"
    expect(svspec).to be_listening
  when "not_listen", "not_listening", "not_be_listening"
    expect(svspec).not_to be_listening
  else
    raise "unknown option : #{v_cmd}"
  end
end

# 2 argument
step "port :v_arg :v_cmd :v_opt" do |v_arg, v_cmd, v_opt|
  svspec = Serverspec::Type::Port.new(v_arg)

  case v_cmd 
  when "listening_with", "be_listening_with"
    expect(svspec).to be_listening.with v_opt
  when "listening_on", "be_listening_on"
    expect(svspec).to be_listening.on v_opt
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
