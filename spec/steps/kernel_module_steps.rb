###
### Kernel_module
###

# 1 argument
step "kernel_module :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Kernel_module.new(v_arg)

  case v_cmd
  when "exist", "loaded", "be_loaded"
    expect(svspec).to be_loaded
  else
    raise "unknown option : #{v_cmd}"
  end
end
