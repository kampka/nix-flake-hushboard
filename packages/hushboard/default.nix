{ pkgs }:

pkgs.python3Packages.buildPythonApplication {

  pname = "hushboard";
  version = "2021-01-08";

  src = pkgs.fetchFromGitHub {
    owner = "stuartlangridge";
    repo = "hushboard";
    rev = "223b6f97164656bd57bd6c86e9bd297caa37cf85";
    sha256 = "sha256-pgBULTveKMR6jxdN2j6g4JdCb9CPsyfzC/DGhsP0JS8=";
  };

  nativeBuildInputs = [ pkgs.wrapGAppsHook ];
  propagateBuildInputs = (with pkgs.python3Packages; [ six setuptools xlib pygobject3 pycairo cffi ]) ++ (with pkgs; [ libpulseaudio gtk3 libappindicator-gtk3 gobject-introspection ]);
  pythonPath = (with pkgs.python3Packages; [ six setuptools xlib pygobject3 pycairo cffi ]) ++ (with pkgs; [ libpulseaudio gtk3 libappindicator-gtk3 gobject-introspection ]);
  LD_LIBRARY_PATH = "${pkgs.libpulseaudio}/lib";
  makeWrapperArgs = [ "--set LD_LIBRARY_PATH ${pkgs.libpulseaudio}/lib" ];

  doCheck = false;

  meta = with pkgs.lib; {
    description = "Mute your mic while you’re typing";
    license = licenses.mit;
  };
}
