{ lib, stdenv, fetchzip, ocaml, findlib, ocamlbuild }:

stdenv.mkDerivation {

  name = "ocaml${ocaml.version}-csv-1.5";

  src = fetchzip {
    url = "https://github.com/Chris00/ocaml-csv/releases/download/1.5/csv-1.5.tar.gz";
    sha256 = "1ca7jgg58j24pccs5fshis726s06fdcjshnwza5kwxpjgdbvc63g";
  };

  buildInputs = [ ocaml findlib ocamlbuild ];

  configurePhase = ''
    runHook preConfigure
    ocaml setup.ml -configure --prefix $out --enable-tests
    runHook postConfigure
  '';

  buildPhase = ''
    runHook preBuild
    ocaml setup.ml -build
    runHook postBuild
  '';

  doCheck = true;
  checkPhase = ''
    runHook preCheck
    ocaml setup.ml -test
    runHook postCheck
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p "$OCAMLFIND_DESTDIR"
    ocaml setup.ml -install
    runHook postInstall
  '';

  meta = with lib; {
    description = "A pure OCaml library to read and write CSV files";
    homepage = "https://github.com/Chris00/ocaml-csv";
    license = licenses.lgpl21;
    maintainers = [ maintainers.vbgl ];
    platforms = ocaml.meta.platforms or [];
  };
}
