# Default task: show help
default:
  just --list

# Rebuild NixOS system configuration
rebuild-system:
  sudo nixos-rebuild switch --flake .#nixos-semar

# Test NixOS system configuration
rebuild-test:
  sudo nixos-rebuild test --flake .#nixos-semar

# Rebuild boot NixOS system configuration
rebuild-boot:
  sudo nixos-rebuild boot --flake .#nixos-semar

# Dry-build NixOS system configuration
dry-build:
  sudo nixos-rebuild dry-build --flake .#nixos-semar

# Rebuild Home Manager configuration
rebuild-home:
  rm -rf ~/.config/Windsurf/User/settings.json
  home-manager switch --flake .#home-semar

# Rebuild both system and Home Manager
rebuild-all: rebuild-system rebuild-home

# Update flake inputs
update:
  nix flake update

# check flake inputs
check:
  nix flake check

# Update flake inputs
show:
  nix flake show
  
# Clean Nix store (remove old generations and garbage)
clean:
  sudo nix-collect-garbage -d
  nix-store --gc
