###
### Docker_container
###

# 1 argument
step "docker_container :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Docker_container.new(v_arg)

  case v_cmd
  when "exist"
    expect(svspec).to exist
  when "be_running", "running"
    expect(svspec).to be_running
  else
    raise "unknown option : #{v_cmd}"
  end
end

# 2 argument
step "docker_container :v_arg :v_cmd v_opt" do |v_arg, v_cmd, v_opt|
  svspec = Serverspec::Type::Docker_container.new(v_arg)

  case v_cmd 
  when "have","have_volume"
    expect(svspec).to have_volume "#{v_opt}"
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
