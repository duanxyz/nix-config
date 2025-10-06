{
  pkgs,
  selfOutPath,
  hosts,
}:
{
  language-server = with pkgs; {
    nixd = {
      command = "${nixd}/bin/nixd";
      args = [
        "--inlay-hints"
        "--semantic-tokens"
      ];
      # NOTE: gunakan selfOutPath supaya tidak tergantung path absolut user
      config.option = {
        nixos.expr = ''(builtins.getFlake "${selfOutPath}").nixosConfigurations.${hosts.nixos}.options'';
        home-manager.expr = ''(builtins.getFlake "${selfOutPath}").homeConfigurations.${hosts.home}.options'';
      };
    };
    fish-lsp = {
      command = "${fish-lsp}/bin/fish-lsp";
    };
  };
}
