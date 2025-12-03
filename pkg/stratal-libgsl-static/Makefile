
# TODO lint
#./.lint_ok: stratal-libgsl-static_2.5.deb
#	lintian ./stratal-libgsl-static_2.5.deb && \
#	touch ./lint_ok

stratal-libgsl-static_2.5.deb: ./built/usr/lib/libgsl.la
	dpkg-deb --root-owner-group --build built && \
	mv built.deb stratal-libgsl-static_2.5.deb

./built/usr/lib/libgsl.la: build/gsl-2.5/libgsl.la
	cp -rT ./template ./built && \
	cd build/gsl-2.5 && \
	make DESTDIR="${PWD}/built" install

build/gsl-2.5/libgsl.la: build/gsl-2.5/Makefile
	cd build/gsl-2.5 && \
	make -j$(nproc)

build/gsl-2.5/Makefile: build/gsl-2.5/.patch_ok
	cd build/gsl-2.5 && \
	./configure \
		--prefix=/usr \
		--enable-maintainer-mode \
		--disable-shared \
		--enable-static

build/gsl-2.5/.patch_ok: build/gsl-2.5/configure
	# the ./configure file expects /bin/sh to be bash-compatible
	# apparently, but on ubuntu (debian too?) bin/sh is dash.
	# Fix by overriding shebang.
	cd build/gsl-2.5 && \
	sed -i -e '1i #!/bin/bash' ./configure && \
	touch .patch_ok


build/gsl-2.5/configure: vendor/.verified_ok
	mkdir -p build && \
	cd build && \
	tar xf ../vendor/gsl-2.5.tar.gz && \
	cd gsl-2.5 && \
	./autogen.sh

vendor/.verified_ok: vendor/gsl-2.5.tar.gz
	cd vendor && \
	gpg --import gsl_key.txt && \
	gpg --verify gsl-2.5.tar.gz.sig && \
	touch .verified_ok

vendor/gsl-2.5.tar.gz:
	git annex get vendor

clean:
	rm -rf ./built
	rm -rf ./build
	rm -rf ./*.deb
	rm -rf ./.lint_ok
	rm -rf ./vendor/.verified_ok

