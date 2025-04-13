{
  inputs,
  cell,
}:
{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
      prettybat
      batpipe
      batgrep
      batwatch
    ];
    config = {
      italic-text = "always";
    };
  };
}
