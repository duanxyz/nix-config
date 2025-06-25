{
  inputs,
  cell,
}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.windsurf;
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
      };
    };
  };
}
