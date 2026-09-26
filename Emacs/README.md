I grabbed the source code from the official release mirrors:

- https://www.gnu.org/software/emacs/
- http://ftpmirror.gnu.org/emacs/

Then followed these blogs for a performance build:

- https://www.masteringemacs.org/article/speed-up-emacs-libjansson-native-elisp-compilation
- https://www.jamescherti.com/compiling-emacs/

Here's the config settings:

Set compiler variables:

```fish
set -x CC gcc-14
set -x CFLAGS "-O2 -pipe -march=native -mtune=native -fno-omit-frame-pointer -fno-plt -flto=auto"
set -x LDFLAGS "-Wl,-O2 -Wl,-z,now -Wl,-z,relro -Wl,--sort-common -Wl,--as-needed -Wl,-z,pack-relative-relocs -flto=auto -O2"
```

```
./configure \
  --prefix="$HOME/.local/"
  --without-x \
  --with-pgtk \
  --with-toolkit-scroll-bars \
  --with-cairo \
  --without-xft \
  --with-harfbuzz \
  --without-libotf \
  --with-gnutls \
  --without-xdbe \
  --without-xim \
  --without-gpm \
  --disable-gc-mark-trace \
  --with-gsettings \
  --with-modules \
  --with-threads \
  --with-libgmp \
  --with-xml2 \
  --with-tree-sitter \
  --with-zlib \
  --without-included-regex \
  --with-native-compilation \
  --with-file-notification=inotify \
  --without-compress-install
```

Then build and install:

```
make -j "$(nproc)" -l "$(nproc --ignore=1)"
sudo make install-strip
```
