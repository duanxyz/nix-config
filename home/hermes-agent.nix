{
  inputs,
  ...
}:
{
  imports = [ inputs.hermes-agent.homeManagerModules.default ];

  programs.hermes-agent.enable = true;

  services.hermes-agent = {
    enable = true;
    gateway.enable = true;
    settings = {
      model = {
        default = "Atria-Dawn-Preview";
        provider = "custom";
        base_url = "https://api.atria-asi.ai/v1";
        key_env = "ATRIA_API_KEY";
        streaming = true;
        context_length = 256000;
      };
      context_compression = {
        enabled = true;
        threshold = 0.75; # Compress at 75% (192k tokens)
        target_ratio = 0.3; # Keep 30% after compression
        protect_last = 30; # Protect last 30 messages
      };
      terminal = {
        timeout = 300;
      };
    };
    environmentFiles = [ "/run/agenix/hermes-env" ];
  };
}
