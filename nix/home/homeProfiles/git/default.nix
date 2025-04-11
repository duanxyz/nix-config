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
  };

  home.file.".ssh/allowed_signers".text = ''
    ${email} ssh-ed25519 ${secrets.userKey1}
  '';
}
