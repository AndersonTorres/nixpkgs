{stdenv, fetchurl, gettext, ncurses
, gtkGUI ? false
, pkgconfig ? null
, gtk2 ? null}:

assert gtkGUI -> pkgconfig != null && gtk2 != null;

stdenv.mkDerivation rec {
  pname = "aumix";
  version = "2.9.1";

  src = fetchurl {
    url = "http://www.jpj.net/~trevor/aumix/releases/${pname}-${version}.tar.bz2";
    sha256 = "0a8fwyxnc5qdxff8sl2sfsbnvgh6pkij4yafiln0fxgg6bal7knj";
  };

  buildInputs = [ gettext ncurses ]
    ++ (if gtkGUI then [pkgconfig gtk2] else []);

  meta = {
    description = "Audio mixer for X and the console";
    longDescription = ''
      Aumix adjusts an audio mixer from X, the console, a terminal,
      the command line or a script.
    '';
    homepage = "http://www.jpj.net/~trevor/aumix.html";
    license = stdenv.lib.licenses.gpl2Plus;

    maintainers = [ ];
    platforms = stdenv.lib.platforms.linux;
  };
}
