{ lib, buildManPages }:

buildManPages {
  pname = "s6-man-pages";
  version = "2.10.0.1.2";
  sha256 = "1r2gyjwma4v6v5v5by4ivkk9jagn6006l5dcpsli4xijg0v7mq1v";
  description = "Port of the documentation for the s6 supervision suite to mdoc";
  sections = [ 1 7 ];
  maintainers = [ lib.maintainers.sternenseemann ];
}
