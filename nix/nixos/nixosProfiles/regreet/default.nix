{
  inputs,
  cell,
}:
{
  services.greetd = {
    enable = true;
    settings = {
      # auto login
      default_session = {
        command = "${pkgs.uwsm}/bin/uwsm start default";
        user = "duan";
      };
    };
  };

  programs.regreet = {
    enable = true;
  };
}
