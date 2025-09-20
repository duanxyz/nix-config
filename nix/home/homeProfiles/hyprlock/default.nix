{ config, lib, pkgs, inputs, cell, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = [
        {
          monitor = "";
          path = "~/Downloads/pexels-eberhardgross-691668.jpg";
          blur_passes = 3;
          blur_size = 8;
          brightness = 0.5;
          contrast = 0.5;
        }
      ];
      input-field = [
        {
          monitor = "";
          size = "200, 50";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgb(255, 255, 255)";
          inner_color = "rgb(0, 0, 0)";
          font_color = "rgb(255, 255, 255)";
          fade_on_empty = true;
          placeholder_text = "<i>Enter Password...</i>";
          hide_input = false;
          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];
      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] date +"%H:%M:%S"'';
          color = "rgb(255, 255, 255)";
          font_size = 50;
          font_family = "Noto Sans";
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
