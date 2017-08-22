###
### Linux_kernel_parameter
###

# 2 argument
step "linux_kernel_parameter :v_arg :v_cmd :v_opt" do |v_arg, v_cmd, v_opt|
  svspec = Serverspec::Type::Linux_kernel_parameter.new(v_arg)

  case v_cmd 
  when "is"
    expect(svspec).to eq "#{v_opt}"
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
