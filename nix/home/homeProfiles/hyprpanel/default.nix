{
  inputs,
  cell,
}:
{
  programs.hyprpanel = {
    enable = true;
    package = inputs.hyprpanel.packages.default;
  };

  home.packages = with pkgs; [
    libgtop
    dart-sass
    wl-clipboard
    gvfs
    gtksourceview
    libsoup_3
    grimblast
    wf-recorder
  ];
}
