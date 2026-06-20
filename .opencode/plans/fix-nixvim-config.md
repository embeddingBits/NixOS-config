# Fix nixvim config not being loaded

## Problem

Neovim starts with default config because the raw/unwrapped `neovim` package overrides
nixvim's wrapped version in PATH.

## Root cause

Three conflicting neovim installations:

| Location | Installs | Effect |
|---|---|---|
| `nixos/modules/default.nix:110` | `neovim` in `environment.systemPackages` | System-level raw binary |
| `home-manager/home-packages.nix:13` | `neovim` in `home.packages` | User-level raw binary |
| `dotfiles/nixvim/default.nix:9` | `programs.nixvim.enable = true` | Wrapped with nixvim config (via `programs.neovim`) |

The raw packages win the PATH collision, so nixvim's generated config never loads.

## Fix

### 1. Remove `neovim` from `nixos/modules/default.nix` (line 109-110)

```diff
   environment.systemPackages = with pkgs; [
-    neovim
     emacs
     wget
```

### 2. Remove `neovim` from `home-manager/home-packages.nix` (line 13)

```diff
-    neovim emacs
+    emacs
```

### 3. Rebuild and verify

```bash
make home
nvim  # should now load nixvim config (number, relativenumber, etc.)
```

nixvim's `programs.nixvim.enable = true` already enables `programs.neovim`
internally and wraps the binary with the generated config — no additional
changes needed in the nixvim config itself.
