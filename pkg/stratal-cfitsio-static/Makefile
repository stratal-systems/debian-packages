
# TODO lint
#./.lint_ok: stratal-libgsl-static_2.5.deb
#	lintian ./stratal-libgsl-static_2.5.deb && \
#	touch ./lint_ok

stratal-libcfitsio-static_4.6.3.deb: ./built/usr/lib/libcfitsio.la
	dpkg-deb --root-owner-group --build built && \
	mv built.deb stratal-libcfitsio-static_4.6.3.deb

./built/usr/lib/libcfitsio.la: build/cfitsio-cfitsio-4.6.3/libcfitsio.la
	cp -rT ./template ./built && \
	cd build/cfitsio-cfitsio-4.6.3 && \
	make DESTDIR="${PWD}/built" install

build/cfitsio-cfitsio-4.6.3/libcfitsio.la: build/cfitsio-cfitsio-4.6.3/Makefile
	cd build/cfitsio-cfitsio-4.6.3 && \
	make -j$(nproc)

build/cfitsio-cfitsio-4.6.3/Makefile: build/cfitsio-cfitsio-4.6.3/configure
	cd build/cfitsio-cfitsio-4.6.3 && \
	./configure \
		--prefix=/usr \
		--disable-curl \
		--enable-maintainer-mode \
		--disable-shared \
		--enable-static \
		--enable-pic \
		CFLAGS="-fPIC" \
		CXXFLAGS="-fPIC"

build/cfitsio-cfitsio-4.6.3/configure: vendor/cfitsio-4.6.3.tar.gz
	mkdir -p build && \
	cd build && \
	tar xf ../vendor/cfitsio-4.6.3.tar.gz

vendor/cfitsio-4.6.3.tar.gz:
	git annex get vendor

clean:
	rm -rf ./built
	rm -rf ./build
	rm -rf ./*.deb
	rm -rf ./.lint_ok
	rm -rf ./vendor/.verified_ok

