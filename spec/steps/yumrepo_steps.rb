###
### Yumrepo
###

# 1 argument
step "yumrepo :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Yumrepo.new(v_arg)

  case v_cmd
  when "exist"
    expect(svspec).to exist
  when "be_enabled", "enabled"
    expect(svspec).to be_enabled
  when "be_disabled", "disabled"
    expect(svspec).not_to be_enabled
  else
    raise "unknown option : #{v_cmd}"
  end
end
