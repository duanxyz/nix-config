{
  inputs,
  ...
}:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [ (inputs.self + "/assets/wallpaper/musashi-back.jpg") ];

      wallpaper = [
        ("," + inputs.self + "/assets/wallpaper/musashi-back.jpg")
      ];
    };
  };
}
