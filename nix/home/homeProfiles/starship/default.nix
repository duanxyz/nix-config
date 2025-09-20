{ config, lib, pkgs, inputs, cell, ... }:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
  };
}
