{
  inputs,
  cell,
}:
{
  programs.git = {
    enable = true;
    userName = "Muhammad Ridwan";
    userEmail = "25993873+duanxyz@users.noreply.github.com";

    extraConfig = {
      core.editor = "hx";
      core.autocrlf = "input";
      pull.rebase = true;
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
