TERMUX_SUBPKG_INCLUDE="
opt/openjdk/include/jawt.h
opt/openjdk/include/linux/jawt_md.h
opt/openjdk/jmods/java.desktop.jmod
opt/openjdk/lib/libawt_xawt.so
opt/openjdk/lib/libfontmanager.so
opt/openjdk/lib/libjawt.so
opt/openjdk/lib/libsplashscreen.so
"
TERMUX_SUBPKG_DESCRIPTION="Portion of openjdk-21 requiring X11 functionality"
TERMUX_SUBPKG_DEPENDS="fontconfig, freetype, giflib, libandroid-shmem, libpng, libx11, libxext, libxi, libxrandr, libxrender, libxt, libxtst"
TERMUX_SUBPKG_BREAKS="openjdk-21 (<< 21.0)"
TERMUX_SUBPKG_REPLACES="openjdk-21 (<< 21.0)"
TERMUX_PKG_BREAKS="openjdk-21-x"
