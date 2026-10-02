{
  config = {
    xwayland = {
      force_zero_scaling = true;
    };
    general = {
      gaps_in = 6;
      gaps_out = 10;
      border_size = 2;
      col = {
        active_border = {
          colors = [
            "rgba(33ccffee)"
            "rgba(00ff99ee)"
          ];
          angle = 45;
        };
        inactive_border = "rgba(595959aa)";
      };
      layout = "dwindle";
      allow_tearing = false;
      resize_on_border = true;
    };
  };
}
