function nixf
  if test (count $argv) -lt 2
    echo "Usage: nixf <profile_type> <relative_path> [--edit]"
    echo "Supported profile types: homeProfiles, nixosProfiles, hardwareProfiles, disko"
    return 1
  end

  set profile_type $argv[1]
  set relative_path $argv[2]

  set base_dir ""
  switch $profile_type
    case "homeProfiles"
      set base_dir "nix/home/homeProfiles"
    case "nixosProfiles"
      set base_dir "nix/nixos/nixosProfiles"
    case "hardwareProfiles"
      set base_dir "nix/nixos/hardwareProfiles"
    case "disko"
      set base_dir "nix/nixos/disko"
    case '*'
      echo "Unsupported profile type: $profile_type"
      echo "Supported profile types: homeProfiles, nixosProfiles, hardwareProfiles, disko"
      return 1
  end

  set file_path "$base_dir/$relative_path"
  set dir (dirname $file_path)

  if not test -d $dir
    mkdir -p $dir
    echo "Created directory: $dir"
  end

  if not test -f $file_path
    printf '{\n  inputs,\n  cell,\n}:\n{}\n' > $file_path
    echo "Created Nix file: $file_path"
  else
    echo "File already exists: $file_path"
  end

  if contains -- --edit $argv
    $EDITOR $file_path
  end
end
