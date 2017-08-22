###
### LXC
###

# 1 argument
step "lxc :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Lxc.new(v_arg)

  case v_cmd
  when "exist"
    expect(svspec).to exist
  when "be_running", "running"
    expect(svspec).to be_running
  else
    raise "unknown option : #{v_cmd}"
  end
end
