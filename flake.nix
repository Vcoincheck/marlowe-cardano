# This file is part of the IOGX template and is documented at the link below:
# https://www.github.com/input-output-hk/iogx#31-flakenix

{
  description = "Marlowe Cardano implementation";

  inputs = {
    cardano-world.url = "github:input-output-hk/cardano-world/d22f50fc77d23e2612ca2b313a098dd0b48834d4";
    std.url = "github:divnix/std";
    std.inputs.n2c.follows = "n2c";
    iogx.url = "github:input-output-hk/iogx";
    iogx.inputs.CHaP.follows = "CHaP";
    iogx.inputs.hackage.follows = "hackage";
    CHaP = {
      url = "github:input-output-hk/cardano-haskell-packages?ref=repo";
      flake = false;
    };
    hackage = {
      url = "github:input-output-hk/hackage.nix";
      flake = false;
    };
    # Use upstream when https://github.com/nlewo/nix2container/pull/82 is merged
    n2c.url = "github:shlevy/nix2container/no-Size-on-dir";
    marlowe-plutus.url = "github:input-output-hk/marlowe-plutus";
    cardano-node.url = "github:input-output-hk/cardano-node?ref=8.1.2";
  };

  outputs = inputs: inputs.iogx.lib.mkFlake {
    inherit inputs;
    repoRoot = ./.;
  };

  nixConfig = {
    extra-substituters = [
      "https://cache.iog.io"
    ];
    extra-trusted-public-keys = [
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
    ];
    allow-import-from-derivation = true;
  };
}
