{ lib, buildManPages }:

buildManPages {
  pname = "execline-man-pages";
  version = "2.8.0.0.1";
  sha256 = "0nyhkjbxyffcfyr7h7wgyj2znm4g1cz9010a5cjk097lj53hy1f4";
  description = "Port of the documentation for the execline suite to mdoc";
  sections = [ 1 7 ];
  maintainers = [ lib.maintainers.sternenseemann ];
}
