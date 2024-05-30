rebuild:
	sudo nixos-rebuild switch

gc:
	sudo nix-collect-garbage -d

history:
	nix profile history --profile /nix/var/nix/profiles/system
