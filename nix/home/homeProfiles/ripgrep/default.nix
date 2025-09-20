{ config, lib, pkgs, inputs, cell, ... }:
{
  programs = {
    ripgrep = {
      enable = true;
      arguments = [
        "--max-columns-preview"
        "--colors=line:style:bold"
      ];
    };
    ripgrep-all = {
      enable = true;
    };
  };
}
