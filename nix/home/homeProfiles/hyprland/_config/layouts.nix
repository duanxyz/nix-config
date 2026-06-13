{
  monitor = {
    output = "eDP-1";
    mode = "preferred";
    position = "auto";
    scale = "1";
  };
  config = {
    dwindle = {
      preserve_split = true;
      force_split = 2;
      permanent_direction_override = true;
      special_scale_factor = 0.95;
    };
    master = {
      orientation = "right";
      mfact = 0.6;
    };
  };
}
