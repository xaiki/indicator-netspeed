CC=gcc
CFLAGS=-g -Wall -Wfatal-errors -std=c99 $(shell pkg-config --cflags --libs gtk+-3.0 appindicator3-0.1 libgtop-2.0)
PREFIX=~/.local

all: indicator-netspeed

indicator-netspeed: indicator-netspeed.c
	$(CC) $< $(CFLAGS) -o $@

clean:
	rm -f *.o indicator-netspeed

install:
	install --mode=755 indicator-netspeed  ${PREFIX}/bin/
	install indicator-netspeed.gschema.xml ${PREFIX}/share/glib-2.0/schemas/
	glib-compile-schemas ${PREFIX}/share/glib-2.0/schemas/

uninstall:
	rm ${PREFIX}/bin/indicator-netspeed
	rm ${PREFIX}/share/glib-2.0/schemas/indicator-netspeed.gschema.xml
	glib-compile-schemas ${PREFIX}/share/glib-2.0/schemas/
