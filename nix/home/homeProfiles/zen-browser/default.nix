{
  inputs,
  cell,
}:
{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ]
  ++ (builtins.attrValues (
    inputs.haumea.lib.load {
      src = ./_modules;
      loader = inputs.haumea.lib.loaders.scoped;
      inputs = { inherit config; };
    }
  ));

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];

    profiles."default" = {
      id = 0;
      isDefault = true;
    };
  };
}
