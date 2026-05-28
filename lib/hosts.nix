{
  default = "t14g2amd";

  hosts = {
    infinix = {
      nixos = "nixos-infinix";
      home = "home-infinix";
    };

    t14g2amd = {
      nixos = "nixos-t14g2amd";
      home = "home-t14g2amd";
    };
  };
}
