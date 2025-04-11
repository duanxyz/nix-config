{
  inputs,
  cell,
}:
let
  secrets = import (inputs.self + "/secrets/secrets.nix");
  email = "25993873+duanxyz@users.noreply.github.com";
in
{
  programs.git = {
    enable = true;
    userName = "Muhammad Ridwan";
    userEmail = email;

    signing = {
      format = "ssh";
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    extraConfig = {
      core.editor = "hx";
      core.autocrlf = "input";
      pull.rebase = true;
      init.defaultBranch = "main";
      push.autoSetupRemote = true;

      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    };

    aliases = {
      # Status dan Diff
      st = "status --short";
      df = "diff";
      dfs = "diff --staged";
      # Branching
      br = "branch";
      co = "checkout";
      cob = "checkout -b";
      sw = "switch";
      swb = "switch -c";
      # Commit
      ci = "commit";
      amend = "commit --amend --no-edit";
      aa = "add .";
      cm = "!git add . && git commit -m";
      # Push dan Pull
      ps = "push";
      pl = "pull";
      psf = "push --force-with-lease";
      # Log dan Visualisasi
      lg = "log --oneline --graph --all";
      lgs = "log --oneline";
      # Reset dan Undo
      unstage = "restore --staged .";
      undo = "reset --soft HEAD^";
      discard = "restore .";
      # Stash
      sta = "stash";
      pop = "stash pop";
      stal = "stash list";
    };
  };

  home.file.".ssh/allowed_signers".text = ''
    ${email} ssh-ed25519 ${secrets.userKey1}
  '';
}
