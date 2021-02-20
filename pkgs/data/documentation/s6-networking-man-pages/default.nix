{ lib, buildManPages }:

buildManPages {
  pname = "s6-networking-man-pages";
  version = "2.4.1.0.1";
  sha256 = "0j2jr90mdcbfmzfjzk0j95j8najy1mjg16xd0cm2d6g9gpz5zk2x";
  description = "Port of the documentation for the s6-networking suite to mdoc";
  sections = [ 1 7 ];
  maintainers = [ lib.maintainers.sternenseemann ];
}
