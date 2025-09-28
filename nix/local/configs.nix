{
  inputs,
  cell,
}:
let
  inherit (inputs) nixpkgs;
  inherit (inputs.std.lib.dev) mkNixago;
  inherit (inputs.std.lib) cfg;
in
{
  just = (mkNixago cfg.just) {
    data = {
      tasks = {
        merge-clean = {
          description = "Merge branch to main then delete branch";
          interpreter = nixpkgs.dash;
          content =
            "branch=\"$(git branch --show-current)\"\n"
            + "    if [ -z \"$branch\" ]; then\n"
            + "      echo \"Active branch does not exist.\" >&2\n"
            + "      exit 1\n"
            + "    fi\n"
            + "    if [ \"$branch\" = \"main\" ]; then\n"
            + "      echo \"Currently in main; nothing needs to be merged.\" >&2\n"
            + "      exit 1\n"
            + "    fi\n"
            + "    git checkout main\n"
            + "    git pull --ff-only\n"
            + "    git merge --no-ff \"$branch\"\n"
            + "    git branch -d \"$branch\"\n";
        };
      };
    };
  };
}
