###
### Command
###

# 1 argument
step "command :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::Command.new(v_arg)

  case v_cmd
  when "success"
    expect(svspec.exit_status).to eq 0
  when "fail"
    expect(svspec.exit_status).not_to eq 0
  else
    raise "unknown option : #{v_cmd}"
  end
end

# 2 argument
step "command :v_arg :v_cmd :v_opt" do |v_arg, v_cmd, v_opt|
  svspec = Serverspec::Type::Command.new(v_arg)

  case v_cmd
  when "out","stdout","match"
    expect(svspec.stdout).to match /#{v_opt}/
  when "err","stderr"
    expect(svspec.stderr).to match /#{v_opt}/
  when "status","exit_status","return"
    expect(svspec.exit_status).to eq v_opt.to_i
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
