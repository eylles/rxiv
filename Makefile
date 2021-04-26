version = 27

srcdir = .
VPATH = $(srcdir)

PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

# autoreload backend: inotify/nop
AUTORELOAD = inotify

# enable features requiring giflib (-lgif)
HAVE_GIFLIB = 1

# enable features requiring libexif (-lexif)
HAVE_LIBEXIF = 1

# enable features requiring libwebp (-lwebp)
HAVE_LIBWEBP = 1

cflags = -std=c99 -Wall -pedantic $(CFLAGS) `pkg-config --cflags --libs librsvg-2.0 cairo`
cppflags = -I. $(CPPFLAGS) -D_XOPEN_SOURCE=700 \
  -DHAVE_GIFLIB=$(HAVE_GIFLIB) -DHAVE_LIBEXIF=$(HAVE_LIBEXIF) \
  -DHAVE_LIBWEBP=$(HAVE_LIBWEBP) \
  -I/usr/include/freetype2 -I$(PREFIX)/include/freetype2

lib_exif_0 =
lib_exif_1 = -lexif
lib_gif_0 =
lib_gif_1 = -lgif
lib_webp_0 =
lib_webp_1 = -lwebpdemux -lwebp
ldlibs = $(LDLIBS) -lImlib2 -lX11 -lXft -lfontconfig \
  $(lib_exif_$(HAVE_LIBEXIF)) $(lib_gif_$(HAVE_GIFLIB)) \
  $(lib_webp_$(HAVE_LIBWEBP))

objs = autoreload_$(AUTORELOAD).o commands.o image.o main.o options.o \
  thumbs.o util.o window.o

all: rxiv

.PHONY: all clean install uninstall
.SUFFIXES:
.SUFFIXES: .c .o
$(V).SILENT:

rxiv: $(objs)
	@echo "LINK $@"
	$(CC) $(LDFLAGS) -o $@ $(objs) $(ldlibs) $(cflags)

$(objs): Makefile rxiv.h commands.lst config.h
options.o: version.h
window.o: icon/data.h

.c.o:
	@echo "CC $@"
	$(CC) $(cflags) $(cppflags) -c -o $@ $<

config.h:
	@echo "GEN $@"
	cp $(srcdir)/config.def.h $@

version.h: Makefile .git/index
	@echo "GEN $@"
	v="$$(cd $(srcdir); git describe 2>/dev/null)"; \
	echo "#define VERSION \"$${v:-$(version)}\"" >$@

.git/index:

clean:
	rm -f *.o rxiv

install: all
	@echo "INSTALL bin/rxiv"
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp rxiv $(DESTDIR)$(PREFIX)/bin/
	chmod 755 $(DESTDIR)$(PREFIX)/bin/rxiv
	@echo "INSTALL bin/rxiv-url"
	cp scripts/rxiv-url $(DESTDIR)$(PREFIX)/bin/
	chmod 755 $(DESTDIR)$(PREFIX)/bin/rxiv-url
	@echo "INSTALL bin/rxiv-browser"
	cp scripts/rxiv-browser $(DESTDIR)$(PREFIX)/bin/
	chmod 755 $(DESTDIR)$(PREFIX)/bin/rxiv-browser
	cp rxiv.desktop /usr/share/applications/
	@echo "INSTALL rxiv.1"
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s!PREFIX!$(PREFIX)!g; s!VERSION!$(version)!g" rxiv.1 \
		>$(DESTDIR)$(MANPREFIX)/man1/rxiv.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/rxiv.1
	@echo "INSTALL share/rxiv/"
	mkdir -p $(DESTDIR)$(PREFIX)/share/rxiv/exec
	cp exec/* $(DESTDIR)$(PREFIX)/share/rxiv/exec/
	chmod 755 $(DESTDIR)$(PREFIX)/share/rxiv/exec/*
	$(MAKE) -C icon/ install

uninstall:
	@echo "REMOVE bin/rxiv"
	rm -f $(DESTDIR)$(PREFIX)/bin/rxiv
	@echo "REMOVE bin/rxiv-url"
	rm -f $(DESTDIR)$(PREFIX)/bin/rxiv-url
	@echo "REMOVE bin/rxiv-browser"
	rm -f $(DESTDIR)$(PREFIX)/bin/rxiv-browser
	@echo "REMOVE rxiv.1"
	rm -f $(DESTDIR)$(MANPREFIX)/man1/rxiv.1
	@echo "REMOVE share/rxiv/"
	rm -rf $(DESTDIR)$(PREFIX)/share/rxiv
