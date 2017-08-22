###
### Package
###

# 1 argument
step "package :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Package.new(v_arg)

  case v_cmd
  when "exist", "installed", "be_installed"
    expect(svspec).to be_installed
  else
    raise "unknown option : #{v_cmd}"
  end
end
