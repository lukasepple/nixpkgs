{ stdenv, lib, fetchFromGitHub, ocaml, findlib, ocamlbuild, menhir }:

stdenv.mkDerivation rec {
  name = "ocaml${ocaml.version}-dolmen-${version}";
  version = "0.2";
  src = fetchFromGitHub {
    owner = "Gbury";
    repo = "dolmen";
    rev = "v${version}";
    sha256 = "1b9mf8p6mic0n76acx8x82hhgm2n40sdv0jri95im65l52223saf";
  };

  buildInputs = [ ocaml findlib ocamlbuild ];
  propagatedBuildInputs = [ menhir ];

  makeFlags = [ "-C" "src" ];

  preInstall = ''
    mkdir -p "$OCAMLFIND_DESTDIR"
  '';

  meta = {
    description = "An OCaml library providing clean and flexible parsers for input languages";
    license = lib.licenses.bsd2;
    maintainers = [ lib.maintainers.vbgl ];
    inherit (src.meta) homepage;
    inherit (ocaml.meta) platforms;
  };
}
