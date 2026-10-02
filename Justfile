default:
    @just --list

# rebuild dan switch sistem host ini
switch:
    nh os switch

# build dan set boot entry, tanpa switch
boot:
    nh os boot

# rebuild home-manager
home:
    nh home switch

# build saja, lalu tampilkan diff terhadap sistem aktif
build:
    nh os build

update:
    nix flake update

check:
    nix fmt
    nix flake check -L

# merge branch aktif ke main lalu hapus branch
merge-clean:
    #!/usr/bin/env sh
    set -e
    branch="$(git branch --show-current)"
    [ -n "$branch" ] && [ "$branch" != "main" ] || { echo "bukan di feature branch" >&2; exit 1; }
    git checkout main
    git pull --ff-only
    git merge --no-ff "$branch"
    git branch -d "$branch"