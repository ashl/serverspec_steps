###
### User
###

# 1 argument
step "user :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::User.new(v_arg)

  case v_cmd
  when "exist"
    expect(svspec).to exist
  when "no_password"
    expect(svspec.encrypted_password).to match "/^.{0,2}$/"
  else
    raise "unknown option : #{v_cmd}"
  end
end

# 2 argument
step "user :v_arg :v_cmd v_opt" do |v_arg, v_cmd, v_opt|
  svspec = Serverspec::Type::User.new(v_arg)

  case v_cmd 
  when "group", "belong_to_group"
    expect(svspec).to belong_to_group v_opt
  when "belong_to_primary_group"
    expect(svspec).to belong_to_primary_group v_opt
  when "uid", "have_uid"
    expect(svspec).to have_uid v_opt.to_i
  when "directory", "have_home_directory"
    expect(svspec).to have_home_directory v_opt
  when "shell", "have_login_shell"
    expect(svspec).to have_login_shell v_opt
  when "have_authorized_key"
    expect(svspec).to have_authorized_key v_opt
  when "password", "encrypted_password"
    expect(svspec.encrypted_password).to match v_opt
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
