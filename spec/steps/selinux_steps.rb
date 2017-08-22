###
### Selinux
###

# 1 argument
step "selinux :v_cmd" do |v_cmd|
  svspec = Serverspec::Type::Selinux.new()

  case v_cmd
  when "be_disabled", "disabled"
    expect(svspec).to be_disabled
  when "be_enforcing", "enforcing"
    expect(svspec).to be_enforcing
  when "be_permissive", "permissive"
    expect(svspec).to be_permissive
  else
    raise "unknown option : #{v_cmd}"
  end
end
