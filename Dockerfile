FROM debian:bookworm
RUN \
	echo 'deb http://deb.debian.org/debian bookworm-backports main' >> \
		/etc/apt/sources.list \
		&& \
	apt update
RUN \
	apt install -t bookworm_backports \
		cmake \
		&& \
	apt install -y \
		autoconf \
		debhelper \
		gcc \
		git \
		git-annex \
		gpg \
		libcurl4-openssl-dev \
		libtool \
		lintian \
		make \
		zlib1g-dev \
		&& \
	cmake --version && \
	gcc --version && \
	ldd --version && \
	:

