###
### File
###

# 1 argument
step "file :v_arg :v_cmd" do |v_arg, v_cmd|
  svspec = Serverspec::Type::File.new(v_arg)

  case v_cmd
  when "be_file"
    expect(svspec).to be_file
  when "exist", "exists"
    expect(svspec).to exist
  when "be_directory"
    expect(svspec).to be_directory
  when "be_symlink"
    expect(svspec).to be_symlink
  when "be_block_device"
    expect(svspec).to be_block_device
  when "be_character_device"
    expect(svspec).to be_character_device
  when "be_pipe"
    expect(svspec).to be_pipe
  when "be_socket"
    expect(svspec).to be_socket
  when "be_readable"
    expect(svspec).to be_readable
  when "be_writable"
    expect(svspec).to be_writable
  when "be_executable"
    expect(svspec).to be_executable
  when "be_immutable"
    expect(svspec).to be_immutable
  when "be_mounted"
    expect(svspec).to be_mounted
  else
    raise "unknown option : #{v_cmd}"
  end
end

# 2 argument
step "file :v_arg :v_cmd v_opt" do |v_arg, v_cmd, v_opt|
  svspec = Serverspec::Type::File.new(v_arg)

  case v_cmd 
  when "match", "contain"
    expect(svspec.content).to match /#{v_opt}/
  when "be_mode", "mode"
    expect(svspec).to be_mode v_opt
  when "be_owned_by", "owned"
    expect(svspec).to be_owned_by v_opt
  when "be_grouped_into", "grouped"
    expect(svspec).to be_grouped_into v_opt
  when "be_linked_to", "linked"
    expect(svspec).to be_linked_to v_opt
  when "be_version"
    expect(svspec).to be_version v_opt
  when "md5sum", "md5"
    expect(svspec.md5sum).to eq v_opt
  when "selinux_label"
    expect(svspec.selinux_label).to eq v_opt
  when "sha256sum", "sha256"
    expect(svspec.sha256).to eq v_opt
  when "bigger", "bigger_than"
    expect(svspec.size).to > v_opt.to_i
  when "smaller", "smaller_than"
    expect(svspec.size).to < v_opt.to_i
  else
    raise "unknown option : #{v_cmd} #{v_opt}"
  end
end
