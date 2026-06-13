{
  cell,
  ...
}:
{
  imports = with cell.nixosProfiles; [
    hyprland
    pipewire
    regreet
    mtp
  ];
}
