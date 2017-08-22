###
### Zfs
###

# 1 argument
step "zfs :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Zfs.new(v_arg)

  case v_cmd
  when "exist"
    expect(svspec).to exist
  else
    raise "unknown option : #{v_cmd}"
  end
end
