{
  inputs,
  cell,
}:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [ "~/Downloads/pexels-eberhardgross-691668.jpg" ];

      wallpaper = [
        ",~/Downloads/pexels-eberhardgross-691668.jpg"
      ];
    };
  };
}
