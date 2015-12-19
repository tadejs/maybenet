build : build/include/oasys build/include/dtn

ext-src : ext/oasys-1.6.0 ext/dtn-2.9.0

have_deps : 
	sudo apt-get install tcl8.5 tcl8.5-dev libdb-dev libxerces-c2-dev libxerces-c28 libxerces-c3.1 libxerces2-java tcl-tclreadline && touch have_deps

ext :
	mkdir ext
	cd ext
	
ext/dtn-2.9.0.tgz : ext
	wget http://sourceforge.net/projects/dtn/files/DTN2/dtn-2.9.0/dtn-2.9.0.tgz -O $@

ext/oasys-1.6.0.tgz : ext
	cd ext
	wget http://sourceforge.net/projects/dtn/files/oasys/oasys-1.6.0/oasys-1.6.0.tgz -O $@

% : %.tgz
	tar xf $< -C ext


build/include/oasys:
	cd ext/oasys-1.6.0 && \
	./configure \
	--prefix=/home/pi/maybenet/build/ \
	--with-extra-cflags='-O2 -march=native -mtune=native' \
	--with-extra-ldflags='-O2' \
	--disable-debug && \
	make && \
	make install

build/include/dtn:
	cd ext/dtn-2.9.0 && \
	./configure \
	--prefix=/home/pi/maybenet/build/ \
	--with-extra-cflags='-O2 -march=native -mtune=native' \
	--with-extra-ldflags='-O2' \
	--disable-debug \
	--with-oasys=/home/pi/maybenet/build && \
	make && \
	make install

