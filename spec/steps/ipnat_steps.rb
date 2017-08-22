###
### Ipnat
###

# 2 argument
step "ipnat :v_cmd :v_opt" do |v_cmd, v_opt|
  svspec = Serverspec::Type::Ipnat.new()

  case v_cmd 
  when "have","have_rule"
    expect(svspec).to have_rule "#{v_opt}"
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
