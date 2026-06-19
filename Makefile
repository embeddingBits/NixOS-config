.PHONY: update
home:
	home-manager switch --flake .#ebits

.PHONY: system
system:
	sudo nixos-rebuild switch --flake .#workstation

.PHONY: home-update
home-update:
	home-manager switch --flake .#ebits --upgrade

.PHONY: system-update
system-update:
	sudo nixos-rebuild switch --flake .#workstation --upgrade

.PHONY: clean
clean:
	nix-collect-garbage -d
