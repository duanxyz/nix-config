{
  pkgs,
  ...
}:
let
  email = "25993873+duanxyz@users.noreply.github.com";
in
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    signing = {
      format = "ssh";
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    settings = {
      user = {
        name = "Muhammad Ridwan";
        inherit email;
      };
      core = {
        editor = "hx";
        autocrlf = "input";
      };
      pull.rebase = true;
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";

      alias = {
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
  };

  # NOTE: delta is now a top-level program, not nested under programs.git.delta
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      side-by-side = true;
    };
  };

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
      editor = "hx";
      prompt = "enabled";
      aliases = {
        co = "pr checkout";
        rv = "pr review";
        ls = "repo list";
      };
    };
  };

  home.file.".ssh/allowed_signers".text = ''
    ${email} ssh-ed25519  AAAAC3NzaC1lZDI1NTE5AAAAIHrizuun01yw/y8Rh6D5obIBhDrNvcCJI63gBdX6Vvr+
  '';
}
