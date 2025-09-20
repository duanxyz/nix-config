{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
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
    functions =
      let
        dir = ./_functions;
        files = builtins.readDir dir;
        regularFiles = lib.filterAttrs (_: type: type == "regular") files;
      in
      lib.listToAttrs (
        map (file: {
          name = lib.strings.removeSuffix ".fish" file;
          value = builtins.readFile "${dir}/${file}";
        }) (lib.filter (file: lib.hasSuffix ".fish" file) (lib.attrNames regularFiles))
      );
  };
}
