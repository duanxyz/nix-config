{
  inputs,
  ...
}:
{
  imports = [ inputs.hermes-agent.homeManagerModules.default ];

  programs.hermes-agent = {
    enable = true;
    desktop.enable = true;
  };

  services.hermes-agent = {
    enable = true;
    gateway.enable = true;
    settings = {
      model = {
        default = "stealth/space-bunny-alpha";
        provider = "custom";
      };
      providers = {
        stealth = {
          api = "https://openrouter.ai/api/v1";
          key_env = "OPENROUTER_API_KEY";
          default_model = "stealth/space-bunny-alpha";
        };
        atria = {
          api = "https://api.atria-asi.ai/v1";
          key_env = "ATRIA_API_KEY";
          default_model = "Atria-Dawn-Preview";
          context_length = 256000;
        };
      };
    };
    environmentFiles = [ "/run/agenix/hermes-env" ];
  };
}
