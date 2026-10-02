{
  packages =
    pkgs: with pkgs; [
      nerd-fonts.commit-mono
      nerd-fonts.jetbrains-mono
    ];

  monospaceFamilies = [
    "CommitMono Nerd Font"
    "JetBrainsMono Nerd Font"
  ];
}
