{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
{
  programs.vscode = {
    enable = true;
    package = if pkgs ? windsurf then pkgs.windsurf else pkgs.vscode;
    mutableExtensionsDir = true;
    profiles = {
      default = {
        extensions =
          with pkgs.open-vsx;
          with pkgs.vscode-marketplace;
          [
            jnoortheen.nix-ide
            eamodio.gitlens
            aaron-bond.better-comments
            jasew.vscode-helix-emulation
            streetsidesoftware.code-spell-checker
            streetsidesoftware.code-spell-checker-indonesian
            hoovercj.vscode-settings-cycler
            esbenp.prettier-vscode
            tamasfe.even-better-toml
          ];
        keybindings = import ./_config/keybindings.nix;
      };
    };
  };

  home.file.".config/Windsurf/User/settings.json" = {
    text = builtins.readFile ./_config/settings.json;
    onChange = ''
      if [ -L "$HOME/.config/Windsurf/User/settings.json" ]; then
        rm "$HOME/.config/Windsurf/User/settings.json"
      fi

      echo '${builtins.readFile ./_config/settings.json}' > "$HOME/.config/Windsurf/User/settings.json"

      chmod u+w "$HOME/.config/Windsurf/User/settings.json"
    '';
  };
}
