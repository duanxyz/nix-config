{
  inputs,
  ...
}:
let
  wallpaper = inputs.self + "/assets/wallpaper/musashi-back.jpg";
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = true;
      splash = false;
      splash_offset = 2;

      wallpaper = [
        {
          monitor = "";
          path = wallpaper;
        }
      ];
    };
  };
}
