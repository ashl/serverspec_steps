###
### Cron
###

# 2 argument
step "cron :v_arg :v_cmd :v_opt" do |v_arg, v_cmd, v_opt|
  svspec = Serverspec::Type::Cron.new()

  case v_cmd 
  when "have","have_entry"
    expect(svspec).to have_entry("#{v_opt}").with_user(v_arg)
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
