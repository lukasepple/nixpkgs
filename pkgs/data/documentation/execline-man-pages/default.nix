{ lib, buildManPages }:

buildManPages {
  pname = "execline-man-pages";
  version = "2.7.0.1.2";
  sha256 = "0v197yhhsvp4xvv216h536fvnilf0xav7xga4agi2n45prz9c58p";
  description = "Port of the documentation for the execline suite to mdoc";
  sections = [ 1 7 ];
  maintainers = [ lib.maintainers.sternenseemann ];
}
