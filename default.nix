with import <nixpkgs> {};
let
easycrypt = stdenv.mkDerivation {
  name = "easycrypt-1.0";
  src = fetchFromGitHub{
	owner = "EasyCrypt"; 
        repo = "easycrypt"; 
        rev= "708e88c59dc2c2c0cce9d3758abd65e74b42807e";
        sha256= "0j4zpaqmi8jqc2fdc92arjwxw6kyxxdp3bwxs88m2w5ax7rff4kd";


};


  buildInputs = []
    ++ (with ocamlPackages; [ ocaml findlib ocamlbuild (batteries.overrideAttrs (o: { doCheck = false; })) menhir merlin zarith inifiles why3 yojson alt-ergo])
    ;  
  installPhase = ''
	make
        # Make the output directory
        mkdir -p $out/bin
        # Copy the script there and make it executable
	mv ec.native easycrypt
        cp easycrypt $out/bin/
	mkdir -p $out/lib/easycrypt/
	cp -r theories $out/lib/easycrypt/
	cp -r src $out/lib/easycrypt/
        chmod +x $out/bin/easycrypt
      '';
    };
in
# Make an environment for nix-shell
stdenv.mkDerivation {
  name = "easy-env";
  buildInputs = [easycrypt why3 alt-ergo emacs emacsPackages.proofgeneral_HEAD];
}
