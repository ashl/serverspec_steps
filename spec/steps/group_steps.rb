###
### Group
###

# 1 argument
step "group :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Group.new(v_arg)

  case v_cmd
  when "exist"
    expect(svspec).to exist
  else
    raise "unknown option : #{v_cmd}"
  end
end

# 2 argument
step "group :v_arg :v_cmd :v_opt" do |v_arg, v_cmd, v_opt|
  svspec = Serverspec::Type::Group.new(v_arg)

  case v_cmd 
  when "gid","have_gid"
    expect(svspec).to have_gid "#{v_opt}"
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
