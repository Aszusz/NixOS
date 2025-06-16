# NixOS Configuration

Flake-based NixOS configuration for multiple hosts.

## Structure Map
```
.
├── flake.nix                 # Entry point
├── configuration-common.nix  # Shared config
├── hosts/                    # Host configs
│   ├── thinkbook/
│   └── nixvm/                # In progress
├── nixos-modules/            # Modular configs
├── home-modules/             # Home Manager modules
└── home.nix                  # Home Manager config
```

## Usage

```bash
# Build and switch NixOS configuration
nh os switch path/ -H thinkbook
# (sudo nixos-rebuild switch --flake path/#thinkbook)

# Activate Home Manager configuration
nh home switch path/ -U adrian
# (home-manager switch --flake path/#adrian)

# Clean old generations
nh clean all -K 7d
# (sudo nix-collect-garbage -d)
```
