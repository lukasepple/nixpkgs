{ lib, buildManPages }:

buildManPages {
  pname = "s6-networking-man-pages";
  version = "2.4.0.0.2";
  sha256 = "0gg2x4ixjr61iiayypiy3n4qf01c72gl9r9dam9dkik0r6x56mn7";
  description = "Port of the documentation for the s6-networking suite to mdoc";
  sections = [ 1 7 ];
  maintainers = [ lib.maintainers.sternenseemann ];
}
