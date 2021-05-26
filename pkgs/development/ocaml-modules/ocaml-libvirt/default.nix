{ lib, stdenv, fetchFromGitLab, libvirt, autoreconfHook, pkg-config, ocaml, findlib, perl }:

stdenv.mkDerivation rec {
  pname = "ocaml-libvirt";
  version = "0.6.1.5";

  src = fetchFromGitLab {
    owner = "libvirt";
    repo = "libvirt-ocaml";
    rev = "v${version}";
    sha256 = "0xpkdmknk74yqxgw8z2w8b7ss8hpx92xnab5fsqg2byyj55gzf2k";
  };

  propagatedBuildInputs = [ libvirt ];

  nativeBuildInputs = [ autoreconfHook pkg-config findlib perl ];

  buildInputs = [ ocaml ];

  preInstall = ''
    mkdir -p "$OCAMLFIND_DESTDIR"
  '';

  buildPhase = ''
    runHook preBuild
    make all opt CPPFLAGS=-Wno-error
    runHook postBuild
  '';

  installTargets = [ "install-opt" ];

  meta = with lib; {
    description = "OCaml bindings for libvirt";
    homepage = "https://libvirt.org/ocaml/";
    license = licenses.gpl2;
    maintainers = [ maintainers.volth ];
    platforms = ocaml.meta.platforms or [];
  };
}
