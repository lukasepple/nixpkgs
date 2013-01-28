{ stdenv, fetchurl, pkgconfig, wayland, mesa90x, libxkbcommon, pixman
, cairo, libxcb, libXcursor, x11, udev, libdrm2_4_40, mtdev
, libjpeg, pam, autoconf, automake, libtool }:

let version = "1.0.4"; in

stdenv.mkDerivation rec {
  name = "weston-${version}";

  src = fetchurl {
    url = "http://wayland.freedesktop.org/releases/${name}.tar.xz";
    sha256 = "1841sd6i8nq9gs1xkx8lwcg4lzy6yfcs95nnsfaf0y1ppd6c9sj2";
  };

  patches = [
    ./makefile.patch
  ];

  buildInputs = [ pkgconfig wayland mesa90x libxkbcommon pixman
    cairo libxcb libXcursor x11 udev libdrm2_4_40 mtdev
    libjpeg pam autoconf automake libtool ];

  preConfigure = "autoreconf -vfi";

  # prevent install target to chown root weston-launch, which fails
  configureFlags = ''
    --disable-setuid-install
  '';

  meta = {
    description = "Reference implementation of a Wayland compositor";
    homepage = http://wayland.freedesktop.org/;
    license = stdenv.lib.licenses.mit;
  };
}
