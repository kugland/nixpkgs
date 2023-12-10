{ lib
, stdenv
, cmake
, extra-cmake-modules
, ffmpeg
, openal
, libsForQt5
, plasma5Packages }:

stdenv.mkDerivation rec {
  pname = "subtitlecomposer";
  version = "0.8.0";

  src = builtins.fetchTarball {
    url = "https://invent.kde.org/multimedia/${pname}/-/archive/v${version}/${pname}-v${version}.tar.bz2";
    sha256 = "1crs7mn30l0vgzvld8w77yjqz0cs0z1v5phws8qpmik97davg924";
  };

  nativeBuildInputs = [ cmake extra-cmake-modules libsForQt5.wrapQtAppsHook ];
  buildInputs = [ ffmpeg openal ] ++ (with plasma5Packages; [
    kcodecs
    kconfig
    kconfigwidgets
    kcoreaddons
    ki18n
    kio
    ktextwidgets
    kwidgetsaddons
    kxmlgui
    sonnet
  ]);

  meta = with lib; {
    mainProgram = "subtitlecomposer";
    description = ''
      An open source text-based subtitle editor that supports basic and
      advanced editing operations, aiming to become an improved version of
      Subtitle Workshop for every platform supported by Plasma Frameworks.
    '';
    homepage = "https://invent.kde.org/multimedia/subtitlecomposer";
    platforms = platforms.unix;
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ kugland ];
  };
}
