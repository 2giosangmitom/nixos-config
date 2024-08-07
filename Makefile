rebuild:
	sudo nixos-rebuild switch

gc:
	sudo nix-collect-garbage -d
	nix-collect-garbage -d

optimise:
	nix store optimise
	sudo nix store optimise

history:
	nix profile history --profile /nix/var/nix/profiles/system
