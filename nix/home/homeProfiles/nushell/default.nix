{
  lib,
  config,
  ...
}:
{
  programs.nushell = {
    enable = true;

    environmentVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };

    settings = {
      show_banner = false;
      completions.algorithm = "fuzzy";
      history.file_format = "sqlite";
    };

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

    extraConfig = lib.mkAfter ''
      if ($nu.is-interactive and ("ZELLIJ" not-in $env)) {
        ^${lib.getExe config.programs.zellij.finalPackage}
      }

      def --env mkcd [dir: string] { mkdir $dir; cd $dir }

      def --env zd [] {
        let dir = (zoxide query -l | sk --prompt "Select directory: " | str trim)
        if ($dir | is-not-empty) { cd $dir }
      }

      def --env up [levels: int = 1] {
        let path = (1..$levels | each { ".." } | str join "/")
        cd $path
      }

      def --env touchf [file_path: string, --edit, --cd] {
        let dir = ($file_path | path dirname)
        if not ($dir | path exists) { mkdir $dir; print $"Created directory: ($dir)" }
        touch $file_path
        print $"Created file: ($file_path)"
        if $edit { ^$env.EDITOR $file_path }
        if $cd { cd $dir }
      }

      def search [pattern: string, path: string = "."] {
        print "Files:"
        ^fd $pattern $path
        print "\nContents:"
        ^rg $pattern $path
      }

      def nixf [profile_type: string, relative_path: string, --edit] {
        let base_dir = match $profile_type {
          "homeProfiles" => "nix/home/homeProfiles",
          "nixosProfiles" => "nix/nixos/nixosProfiles",
          "hardwareProfiles" => "nix/nixos/hardwareProfiles",
          "disko" => "nix/nixos/disko",
          _ => { print $"Unsupported: ($profile_type)"; return }
        }
        let file_path = $"($base_dir)/($relative_path)"
        let dir = ($file_path | path dirname)
        if not ($dir | path exists) { mkdir $dir }
        if not ($file_path | path exists) {
          "{\n  inputs,\n  cell,\n}:\n{}\n" | save $file_path
          print $"Created: ($file_path)"
        } else { print $"Exists: ($file_path)" }
        if $edit { ^$env.EDITOR $file_path }
      }

      def gcof [] {
        let branch = (git branch --all | lines | where { |l| not ($l | str contains "HEAD") } | sk --prompt "Branch: " | str trim | str replace "* " "")
        if ($branch | is-not-empty) { git checkout $branch }
      }

      def --env gcl [url: string] {
        git clone $url
        cd ($url | path basename | str replace ".git" "")
      }

      def extract [file: string] {
        if not ($file | path exists) { print $"($file) not found"; return }
        if ($file | str ends-with ".tar.gz") or ($file | str ends-with ".tgz") { ^tar -xvzf $file } else if ($file | str ends-with ".tar.xz") { ^tar -xvJf $file } else if ($file | str ends-with ".tar.bz2") or ($file | str ends-with ".tbz2") { ^tar -xvjf $file } else if ($file | str ends-with ".tar") { ^tar -xvf $file } else if ($file | str ends-with ".gz") { ^gunzip $file } else if ($file | str ends-with ".bz2") { ^bunzip2 $file } else if ($file | str ends-with ".zip") { ^unzip $file } else if ($file | str ends-with ".rar") { ^unrar x $file } else { print $"Unsupported: ($file)" }
      }

      def bak [file: string] {
        if not ($file | path exists) { print $"($file) not found"; return }
        cp $file $"($file).bak"
        print $"Backup: ($file).bak"
      }
    '';
  };
}
