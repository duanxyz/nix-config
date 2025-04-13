{
  inputs,
  celll,
}:
{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_gretting
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
    };
  };
}
