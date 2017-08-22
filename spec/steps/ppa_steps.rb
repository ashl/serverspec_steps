###
### PPA
###

# 1 argument
step "ppa :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Ppa.new(v_arg)

  case v_cmd
  when "exist"
    expect(svspec).to exist
  when "enable", "be_enabled"
    expect(svspec).to be_enabled
  else
    raise "unknown option : #{v_cmd}"
  end
end
