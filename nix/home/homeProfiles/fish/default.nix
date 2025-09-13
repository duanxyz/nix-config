{
  inputs,
  cell,
}:
{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting
      set -gx EDITOR hx
      set -gx VISUAL hx
    '';
    shellAliases = {
      cat = "bat";
      g = "git";
      gs = "git status";
      gd = "git add";
      v = "hx";
      f = "fd";
      r = "rg";
      j = "just";
      ".." = "cd ..";
      "..." = "cd ../..";
    };
    functions = {
      mkcd = ''
        function mkcd
          mkdir -p $argv[1]
          cd $argv[1]
        end
      '';
      zd = ''
        function zd
          set dir (zoxide query -l | sk --prompt "Select directory: ")
          if test -n "$dir"
            z $dir
          end
        end
      '';
      up = ''
        function up
          set levels (math $argv[1] + 0)
          if test $levels -le 0
            echo "Please provide a positive number of levels to go up"
            return 1
          end
          set path (string repeat -n $levels "../")
          cd $path
        end
      '';
      gcl = ''
        function gcl
          git clone $argv[1]
          set repo_name (basename $argv[1] .git)
          cd $repo_name
        end
      '';
      gcof = ''
        function gcof
          set branch (git branch --all | grep -v HEAD | sk --prompt "Select branch: ")
          if test -n "$branch"
            set branch (string trim $branch | string replace "* " "")
            git checkout $branch
          end
        end
      '';
      extract = ''
        function extract
          if test (count $argv) -eq 0
            echo "Usage: extract <archive>"
            return 1
          end
          set file $argv[1]
          if not test -f $file
            echo "$file does not exist"
            return 1
          end
          switch $file
            case '*.tar.gz' '*.tgz'
              tar -xvzf $file
            case '*.tar.xz'
              tar -xvJf $file
            case '*.tar.bz2' '*.tbz2'
              tar -xvjf $file
            case '*.tar'
              tar -xvf $file
            case '*.gz'
              gunzip $file
            case '*.bz2'
              bunzip2 $file
            case '*.zip'
              unzip $file
            case '*.rar'
              unrar x $file
            case '*'
              echo "Unsupported archive format: $file"
              return 1
          end
        end
      '';
      bak = ''
        function bak
          if test (count $argv) -eq 0
            echo "Usage: bak <file>"
            return 1
          end
          set file $argv[1]
          if not test -f $file
            echo "$file does not exist"
            return 1
          end
          cp $file $file.bak
          echo "Created backup: $file.bak"
        end
      '';
      rebuild = ''
        function rebuild
          just rebuild-all
        end
      '';
      search = ''
        function search
          if test (count $argv) -eq 0
            echo "Usage: search <pattern> [path]"
            return 1
          end
          set pattern $argv[1]
          set path (test (count $argv) -gt 1; and echo $argv[2]; or echo ".")
          echo "Searching for files matching '$pattern'..."
          fd $pattern $path
          echo "\nSearching for '$pattern' in file contents..."
          rg $pattern $path
        end
      '';
      touchf = ''
        function touchf
          if test (count $argv) -eq 0
            echo "Usage: touchf <file_path> [--edit]"
            return 1
          end
          set file_path $argv[1]
          set dir (dirname $file_path)
          # Create a parent directory if it doesn't already exist
          if not test -d $dir
            mkdir -p $dir
            echo "Created directory: $dir"
          end
          # Create a blank file
          touch $file_path
          echo "Created file: $file_path"
          # If there is an --edit argument, open the file with the editor
          if contains -- --edit $argv
            $EDITOR $file_path
          end
          if contains -- --content $argv
            set content_index (math (contains -i -- --content $argv) + 1)
            echo $argv[$content_index] > $file_path
          end
          if contains -- --cd $argv
            cd $dir
          end
        end
      '';
      nixf = ''
        function nixf
          if test (count $argv) -lt 2
            echo "Usage: nixf <profile_type> <relative_path> [--edit]"
            echo "Supported profile types: homeProfile, nixosProfile, hardwareProfile, disko"
            return 1
          end

          set profile_type $argv[1]
          set relative_path $argv[2]

          # Tentukan direktori dasar berdasarkan jenis profil
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
              echo "Supported profile types: homeProfile, nixosProfile, hardwareProfile, disko"
              return 1
          end

          # Gabungkan base_dir dengan relative_path
          set file_path "$base_dir/$relative_path"
          set dir (dirname $file_path)

          # Buat direktori induk jika belum ada
          if not test -d $dir
            mkdir -p $dir
            echo "Created directory: $dir"
          end

          # Buat file Nix dengan template dasar
          if not test -f $file_path
            echo "{ inputs, cell }:" > $file_path
            echo "{}" >> $file_path
            echo "Created Nix file: $file_path"
          else
            echo "File already exists: $file_path"
          end

          # Jika ada argumen --edit, buka file dengan editor
          if contains -- --edit $argv
            $EDITOR $file_path
          end
        end
      '';
    };
  };
}
