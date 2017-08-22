###
### Mail_alias
###

# 2 argument
step "mail_alias :v_arg :v_cmd v_opt" do |v_arg, v_cmd, v_opt|
  svspec = Serverspec::Type::Mail_alias.new(v_arg)

  case v_cmd 
  when "aliased","be_aliased_to"
    expect(svspec).to be_aliased_to "#{v_opt}"
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
