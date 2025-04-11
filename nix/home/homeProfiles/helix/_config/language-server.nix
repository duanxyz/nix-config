{ pkgs }:
{
  language-server = with pkgs; {
    nixd = {
      command = "${nixd}/bin/nixd";
      args = [
        "--inlay-hints"
        "--semantic-tokens"
      ];
      config.option = {
        nixos.expr = "(builtins.getFlake \"/home/duan/nix-config\").nixosConfigurations.nixos-semar.options";
        home-manager.expr = "(builtins.getFlake \"/home/duan/nix-config\").homeConfigurations.home-semar.options";
      };
    };
    fish-lsp = {
      command = "${fish-lsp}/bin/fish-lsp";
    };
  };
}
