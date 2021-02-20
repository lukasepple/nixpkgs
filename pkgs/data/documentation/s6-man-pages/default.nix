{ lib, buildManPages }:

buildManPages {
  pname = "s6-man-pages";
  version = "2.10.0.2.1";
  sha256 = "1i40ylhr5lbmv4ggv4w37r96qqnnqqljqqqc3c3zgvpflwnzy4h8";
  description = "Port of the documentation for the s6 supervision suite to mdoc";
  sections = [ 1 7 ];
  maintainers = [ lib.maintainers.sternenseemann ];
}
