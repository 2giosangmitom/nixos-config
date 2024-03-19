rebuild:
	sudo nixos-rebuild switch

update:
	sudo nix flake update

gc:
	sudo nix-collect-garbage -d

history:
	nix profile history --profile /nix/var/nix/profiles/system
