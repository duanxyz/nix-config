<!-- # NOTE: Dokumen ini dihasilkan untuk merangkum praktik kontribusi repo; sesuaikan jika alur kerja berubah. -->

# Repository Guidelines

## Project Structure & Module Organization
- Root: `flake.nix` (entry), `flake.lock`, `justfile` (task).
- Nix cells: `nix/`
  - NixOS: `nix/nixos/{hosts,users,hardwareProfiles,nixosProfiles,disko}`.
  - Home: `nix/home/{homeProfiles,homeConfigurations.nix}`.
- Secrets: `secrets/` via agenix (`*.age`, `secrets.nix`).
- Assets: `assets/` (mis. `face-icon.jpg`).

## Build, Test, and Development Commands
- `just dry-build`: evaluasi + build tanpa switch.
- `just check`: `nix flake check` untuk validasi eval/locks.
- `just rebuild-test`: `nixos-rebuild test` (non-persisten).
- `just rebuild-system`: switch host ke `.#nixos-semar`.
- `just rebuild-home`: switch Home Manager ke `.#home-semar`.
- `just rebuild-all`: jalankan system + home.
- `just update`: update input flake; `just clean`: GC dan prune generations.
Contoh: `just dry-build && just check` sebelum `just rebuild-test`.

## Coding Style & Naming Conventions
- Bahasa: Nix. Indent 2 spasi, tanpa tab. Satu concern modul per file.
- Penamaan: blok direktori camelCase (mis. `nixosProfiles`), folder modul kebab/lowercase (mis. `homeProfiles/zen-browser`).
- Layout: gunakan `default.nix` untuk export profile; urutkan atribut, wrap ~100 kolom.
- Formatting: prefer `nix fmt` bila tersedia.

## Testing Guidelines
- Tidak ada test framework tradisional; gunakan evaluasi flake:
  1) `just dry-build`, 2) `just check`, 3) `just rebuild-test`, 4) `just rebuild-system` (atau `just rebuild-home`).
- Target host berada di `nix/nixos/hosts/<host>/`; tambahkan target flake bila menambah host.

## Commit & Pull Request Guidelines
- Commits: Conventional Commits, mis. `feat(home-profiles/hyprpanel): add module`.
- PR: sertakan ringkasan, scope (paths), langkah uji (perintah `just`), dan screenshot untuk UI/Hyprland.
- Tautkan issue relevan; jaga PR kecil dan fokus.

## Security & Configuration Tips
- Rahasia di `secrets/` dengan agenix. Edit via `agenix -e secrets/<name>.age`. Jangan commit private keys.
- Substituters/keys didefinisikan di `flake.nix`; pastikan builder/CI trust caches.

## Debugging & Troubleshooting
- Evaluasi gagal: jalankan `nix flake check -L` atau `nixos-rebuild build --flake .#nixos-semar --show-trace -L` untuk stack trace.
- Aktivasi gagal: gunakan `just rebuild-test` (non-persisten), baca log service terkait dan periksa opsi yang berubah.
- Build bloat/cache: `just clean` lalu ulangi `just dry-build`.

## Alternatif Pendekatan
- Declarative (disarankan): semua perubahan lewat modul flake lalu `rebuild`.
- Manual/imperatif (hanya debugging): `nix build` target derivation spesifik, kemudian inspeksi hasil; rollback sebelum commit.
